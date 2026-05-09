; DESCRIPTION: Renders a white line between points (176, 186) and (65, 159).
; PLAN: r0=176(x1), r1=186(y1), r2=65(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 186
LDI r2, 65
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
