; DESCRIPTION: Renders a cyan line between points (188, 150) and (191, 17).
; PLAN: r0=188(x1), r1=150(y1), r2=191(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 150
LDI r2, 191
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
