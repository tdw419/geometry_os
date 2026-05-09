; DESCRIPTION: Renders a magenta line between points (219, 255) and (114, 253).
; PLAN: r0=219(x1), r1=255(y1), r2=114(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 255
LDI r2, 114
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
