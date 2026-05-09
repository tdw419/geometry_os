; DESCRIPTION: Places a yellow line segment connecting (203, 173) to (353, 94).
; PLAN: r0=203(x1), r1=173(y1), r2=353(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 173
LDI r2, 353
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
