; DESCRIPTION: Places a blue line segment connecting (173, 214) to (117, 81).
; PLAN: r0=173(x1), r1=214(y1), r2=117(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 214
LDI r2, 117
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
