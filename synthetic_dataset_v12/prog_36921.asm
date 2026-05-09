; DESCRIPTION: Renders a green line between points (500, 212) and (114, 86).
; PLAN: r0=500(x1), r1=212(y1), r2=114(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 212
LDI r2, 114
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
