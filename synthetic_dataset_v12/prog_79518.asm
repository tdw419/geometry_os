; DESCRIPTION: Renders a magenta line between points (95, 254) and (272, 96).
; PLAN: r0=95(x1), r1=254(y1), r2=272(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 254
LDI r2, 272
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
