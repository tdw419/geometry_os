; DESCRIPTION: Places a yellow line segment connecting (196, 50) to (108, 142).
; PLAN: r0=196(x1), r1=50(y1), r2=108(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 50
LDI r2, 108
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
