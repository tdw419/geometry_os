; DESCRIPTION: Places a yellow line segment connecting (365, 173) to (159, 17).
; PLAN: r0=365(x1), r1=173(y1), r2=159(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 173
LDI r2, 159
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
