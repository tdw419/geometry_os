; DESCRIPTION: Renders a red line between points (464, 19) and (4, 127).
; PLAN: r0=464(x1), r1=19(y1), r2=4(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 19
LDI r2, 4
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
