; DESCRIPTION: Renders a yellow line between points (391, 253) and (334, 209).
; PLAN: r0=391(x1), r1=253(y1), r2=334(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 253
LDI r2, 334
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
