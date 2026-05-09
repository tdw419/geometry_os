; DESCRIPTION: Places a cyan 49x76 rectangle at position (36, 36).
; PLAN: r0=36(x), r1=36(y), r2=49(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 36
LDI r2, 49
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
