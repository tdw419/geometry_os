; DESCRIPTION: Renders a blue line between points (270, 55) and (116, 174).
; PLAN: r0=270(x1), r1=55(y1), r2=116(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 55
LDI r2, 116
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
