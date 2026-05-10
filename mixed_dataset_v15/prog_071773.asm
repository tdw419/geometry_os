; DESCRIPTION: Places a blue line segment connecting (128, 214) to (27, 172).
; PLAN: r0=128(x1), r1=214(y1), r2=27(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 214
LDI r2, 27
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
