; DESCRIPTION: Places a blue line segment connecting (111, 239) to (54, 203).
; PLAN: r0=111(x1), r1=239(y1), r2=54(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 239
LDI r2, 54
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
