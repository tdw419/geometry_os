; DESCRIPTION: Renders a blue line between points (174, 57) and (376, 143).
; PLAN: r0=174(x1), r1=57(y1), r2=376(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 57
LDI r2, 376
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
