; DESCRIPTION: Places a magenta line segment connecting (121, 219) to (214, 200).
; PLAN: r0=121(x1), r1=219(y1), r2=214(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 219
LDI r2, 214
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
