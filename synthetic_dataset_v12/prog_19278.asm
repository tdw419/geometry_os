; DESCRIPTION: Renders a black line between points (91, 165) and (486, 209).
; PLAN: r0=91(x1), r1=165(y1), r2=486(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 165
LDI r2, 486
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
