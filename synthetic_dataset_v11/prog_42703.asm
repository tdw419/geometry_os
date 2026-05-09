; DESCRIPTION: Places a yellow line segment connecting (206, 185) to (224, 59).
; PLAN: r0=206(x1), r1=185(y1), r2=224(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 185
LDI r2, 224
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
