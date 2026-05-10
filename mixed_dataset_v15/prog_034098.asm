; DESCRIPTION: Renders a yellow box of size 97x52 starting at (19, 89).
; PLAN: r0=19(x), r1=89(y), r2=97(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 89
LDI r2, 97
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
