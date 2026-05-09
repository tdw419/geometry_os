; DESCRIPTION: Places a yellow line segment connecting (322, 222) to (293, 173).
; PLAN: r0=322(x1), r1=222(y1), r2=293(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 222
LDI r2, 293
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
