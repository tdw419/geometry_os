; DESCRIPTION: Places a yellow line segment connecting (209, 253) to (509, 70).
; PLAN: r0=209(x1), r1=253(y1), r2=509(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 253
LDI r2, 509
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
