; DESCRIPTION: Renders a magenta line between points (464, 150) and (41, 54).
; PLAN: r0=464(x1), r1=150(y1), r2=41(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 150
LDI r2, 41
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
