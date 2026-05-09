; DESCRIPTION: Renders a magenta line between points (88, 46) and (443, 239).
; PLAN: r0=88(x1), r1=46(y1), r2=443(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 46
LDI r2, 443
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
