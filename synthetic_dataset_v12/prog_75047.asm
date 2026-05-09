; DESCRIPTION: Renders a magenta line between points (443, 114) and (241, 234).
; PLAN: r0=443(x1), r1=114(y1), r2=241(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 114
LDI r2, 241
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
