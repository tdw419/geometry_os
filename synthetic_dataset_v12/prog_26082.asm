; DESCRIPTION: Renders a magenta line between points (443, 173) and (145, 91).
; PLAN: r0=443(x1), r1=173(y1), r2=145(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 173
LDI r2, 145
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
