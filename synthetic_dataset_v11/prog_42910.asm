; DESCRIPTION: Renders a black line between points (240, 144) and (152, 69).
; PLAN: r0=240(x1), r1=144(y1), r2=152(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 144
LDI r2, 152
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
