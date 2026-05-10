; DESCRIPTION: Renders a magenta line segment connecting (281, 4) to (310, 55).
; PLAN: r0=281(x1), r1=4(y1), r2=310(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 4
LDI r2, 310
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
