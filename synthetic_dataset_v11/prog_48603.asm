; DESCRIPTION: Places a purple line segment connecting (206, 173) to (165, 76).
; PLAN: r0=206(x1), r1=173(y1), r2=165(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 173
LDI r2, 165
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
