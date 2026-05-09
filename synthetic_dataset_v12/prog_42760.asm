; DESCRIPTION: Renders a white box of size 99x52 starting at (84, 196).
; PLAN: r0=84(x), r1=196(y), r2=99(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 196
LDI r2, 99
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
