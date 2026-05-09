; DESCRIPTION: Places a blue line segment connecting (68, 129) to (320, 58).
; PLAN: r0=68(x1), r1=129(y1), r2=320(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 129
LDI r2, 320
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
