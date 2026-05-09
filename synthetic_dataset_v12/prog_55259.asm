; DESCRIPTION: Renders a black line between points (135, 149) and (290, 197).
; PLAN: r0=135(x1), r1=149(y1), r2=290(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 149
LDI r2, 290
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
