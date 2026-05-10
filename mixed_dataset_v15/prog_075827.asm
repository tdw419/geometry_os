; DESCRIPTION: Renders a green box of size 77x11 starting at (188, 124).
; PLAN: r0=188(x), r1=124(y), r2=77(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 124
LDI r2, 77
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
