; DESCRIPTION: Places a blue line segment connecting (463, 224) to (284, 2).
; PLAN: r0=463(x1), r1=224(y1), r2=284(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 224
LDI r2, 284
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
