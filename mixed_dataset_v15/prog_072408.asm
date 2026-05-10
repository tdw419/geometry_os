; DESCRIPTION: Renders a yellow box of size 52x105 starting at (283, 20).
; PLAN: r0=283(x), r1=20(y), r2=52(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 20
LDI r2, 52
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
