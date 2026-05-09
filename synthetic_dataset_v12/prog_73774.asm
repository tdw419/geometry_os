; DESCRIPTION: Places a magenta line segment connecting (505, 165) to (172, 253).
; PLAN: r0=505(x1), r1=165(y1), r2=172(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 165
LDI r2, 172
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
