; DESCRIPTION: Renders a magenta line between points (150, 36) and (278, 254).
; PLAN: r0=150(x1), r1=36(y1), r2=278(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 36
LDI r2, 278
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
