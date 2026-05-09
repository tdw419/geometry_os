; DESCRIPTION: Renders a blue line between points (104, 149) and (311, 132).
; PLAN: r0=104(x1), r1=149(y1), r2=311(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 149
LDI r2, 311
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
