; DESCRIPTION: Places a yellow line segment connecting (69, 16) to (301, 5).
; PLAN: r0=69(x1), r1=16(y1), r2=301(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 16
LDI r2, 301
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
