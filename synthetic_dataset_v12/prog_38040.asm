; DESCRIPTION: Places a cyan 33x71 rectangle at position (266, 14).
; PLAN: r0=266(x), r1=14(y), r2=33(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 14
LDI r2, 33
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
