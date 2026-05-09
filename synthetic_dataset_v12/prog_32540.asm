; DESCRIPTION: Renders a blue line between points (82, 220) and (75, 229).
; PLAN: r0=82(x1), r1=220(y1), r2=75(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 220
LDI r2, 75
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
