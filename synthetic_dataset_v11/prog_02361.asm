; DESCRIPTION: Places a red 88x19 rectangle at position (36, 110).
; PLAN: r0=36(x), r1=110(y), r2=88(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 110
LDI r2, 88
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
