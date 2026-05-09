; DESCRIPTION: Places a blue line segment connecting (50, 173) to (101, 183).
; PLAN: r0=50(x1), r1=173(y1), r2=101(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 173
LDI r2, 101
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
