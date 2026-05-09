; DESCRIPTION: Renders a magenta line between points (317, 116) and (45, 50).
; PLAN: r0=317(x1), r1=116(y1), r2=45(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 116
LDI r2, 45
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
