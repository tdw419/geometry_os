; DESCRIPTION: Places a blue line segment connecting (64, 253) to (146, 214).
; PLAN: r0=64(x1), r1=253(y1), r2=146(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 253
LDI r2, 146
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
