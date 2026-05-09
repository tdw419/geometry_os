; DESCRIPTION: Places a magenta line segment connecting (111, 204) to (219, 60).
; PLAN: r0=111(x1), r1=204(y1), r2=219(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 204
LDI r2, 219
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
