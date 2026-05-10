; DESCRIPTION: Renders a white line segment connecting (4, 27) to (282, 88).
; PLAN: r0=4(x1), r1=27(y1), r2=282(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 27
LDI r2, 282
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
