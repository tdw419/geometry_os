; DESCRIPTION: Renders a blue line between points (295, 198) and (87, 134).
; PLAN: r0=295(x1), r1=198(y1), r2=87(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 198
LDI r2, 87
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
