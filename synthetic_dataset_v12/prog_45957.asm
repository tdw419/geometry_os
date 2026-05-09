; DESCRIPTION: Renders a yellow line between points (51, 9) and (144, 166).
; PLAN: r0=51(x1), r1=9(y1), r2=144(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 9
LDI r2, 144
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
