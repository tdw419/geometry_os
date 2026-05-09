; DESCRIPTION: Places a magenta line segment connecting (302, 47) to (173, 253).
; PLAN: r0=302(x1), r1=47(y1), r2=173(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 47
LDI r2, 173
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
