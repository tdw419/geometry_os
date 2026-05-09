; DESCRIPTION: Places a blue line segment connecting (492, 85) to (346, 223).
; PLAN: r0=492(x1), r1=85(y1), r2=346(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 85
LDI r2, 346
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
