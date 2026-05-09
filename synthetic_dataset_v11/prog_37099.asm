; DESCRIPTION: Places a black line segment connecting (166, 121) to (136, 209).
; PLAN: r0=166(x1), r1=121(y1), r2=136(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 121
LDI r2, 136
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
