; DESCRIPTION: Renders a magenta line between points (63, 183) and (443, 52).
; PLAN: r0=63(x1), r1=183(y1), r2=443(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 183
LDI r2, 443
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
