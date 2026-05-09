; DESCRIPTION: Renders a black line between points (208, 231) and (127, 150).
; PLAN: r0=208(x1), r1=231(y1), r2=127(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 231
LDI r2, 127
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
