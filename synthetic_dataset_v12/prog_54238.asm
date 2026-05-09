; DESCRIPTION: Renders a blue line between points (295, 10) and (452, 160).
; PLAN: r0=295(x1), r1=10(y1), r2=452(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 10
LDI r2, 452
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
