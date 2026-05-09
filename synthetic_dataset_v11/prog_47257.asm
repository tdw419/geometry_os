; DESCRIPTION: Renders a green line between points (65, 186) and (159, 152).
; PLAN: r0=65(x1), r1=186(y1), r2=159(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 186
LDI r2, 159
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
