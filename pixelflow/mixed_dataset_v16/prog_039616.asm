; DESCRIPTION: Renders a yellow line between points (174, 163) and (80, 166).
; PLAN: r0=174(x1), r1=163(y1), r2=80(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 163
LDI r2, 80
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
