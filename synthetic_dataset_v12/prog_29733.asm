; DESCRIPTION: Places a yellow line segment connecting (259, 203) to (284, 188).
; PLAN: r0=259(x1), r1=203(y1), r2=284(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 203
LDI r2, 284
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
