; DESCRIPTION: Renders a yellow line between points (45, 76) and (212, 174).
; PLAN: r0=45(x1), r1=76(y1), r2=212(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 76
LDI r2, 212
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
