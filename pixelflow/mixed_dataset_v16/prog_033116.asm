; DESCRIPTION: Renders a green line between points (250, 110) and (85, 213).
; PLAN: r0=250(x1), r1=110(y1), r2=85(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 110
LDI r2, 85
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
