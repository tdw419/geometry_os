; DESCRIPTION: Places a yellow line segment connecting (173, 208) to (178, 56).
; PLAN: r0=173(x1), r1=208(y1), r2=178(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 208
LDI r2, 178
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
