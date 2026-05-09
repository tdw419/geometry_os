; DESCRIPTION: Draws a black line from (188, 151) to (290, 168).
; PLAN: r0=188(x1), r1=151(y1), r2=290(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 151
LDI r2, 290
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
