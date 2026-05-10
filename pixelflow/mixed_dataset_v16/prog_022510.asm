; DESCRIPTION: Draws a magenta line from (219, 104) to (234, 204).
; PLAN: r0=219(x1), r1=104(y1), r2=234(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 104
LDI r2, 234
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
