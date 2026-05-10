; DESCRIPTION: Places a cyan 62x73 rectangle at position (266, 36).
; PLAN: r0=266(x), r1=36(y), r2=62(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 36
LDI r2, 62
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
