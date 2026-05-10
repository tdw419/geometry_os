; DESCRIPTION: Places a blue line segment connecting (443, 162) to (180, 224).
; PLAN: r0=443(x1), r1=162(y1), r2=180(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 162
LDI r2, 180
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
