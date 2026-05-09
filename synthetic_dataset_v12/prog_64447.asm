; DESCRIPTION: Places a black line segment connecting (420, 141) to (245, 222).
; PLAN: r0=420(x1), r1=141(y1), r2=245(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 141
LDI r2, 245
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
