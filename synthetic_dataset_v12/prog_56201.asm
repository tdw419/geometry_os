; DESCRIPTION: Places a green line segment connecting (331, 203) to (474, 126).
; PLAN: r0=331(x1), r1=203(y1), r2=474(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 203
LDI r2, 474
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
