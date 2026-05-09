; DESCRIPTION: Renders a green line between points (220, 149) and (140, 220).
; PLAN: r0=220(x1), r1=149(y1), r2=140(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 149
LDI r2, 140
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
