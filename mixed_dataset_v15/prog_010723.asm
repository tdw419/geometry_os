; DESCRIPTION: Renders a magenta line between points (443, 224) and (464, 252).
; PLAN: r0=443(x1), r1=224(y1), r2=464(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 224
LDI r2, 464
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
