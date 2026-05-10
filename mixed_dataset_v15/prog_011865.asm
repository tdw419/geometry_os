; DESCRIPTION: Renders a magenta line between points (443, 251) and (344, 180).
; PLAN: r0=443(x1), r1=251(y1), r2=344(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 251
LDI r2, 344
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
