; DESCRIPTION: Renders a black line between points (152, 209) and (2, 225).
; PLAN: r0=152(x1), r1=209(y1), r2=2(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 209
LDI r2, 2
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
