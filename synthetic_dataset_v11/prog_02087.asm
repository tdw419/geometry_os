; DESCRIPTION: Places a white line segment connecting (181, 46) to (253, 206).
; PLAN: r0=181(x1), r1=46(y1), r2=253(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 46
LDI r2, 253
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
