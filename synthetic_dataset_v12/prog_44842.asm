; DESCRIPTION: Places a yellow line segment connecting (499, 234) to (420, 191).
; PLAN: r0=499(x1), r1=234(y1), r2=420(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 234
LDI r2, 420
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
