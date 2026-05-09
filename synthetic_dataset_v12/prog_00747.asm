; DESCRIPTION: Draws a magenta line from (104, 8) to (254, 36).
; PLAN: r0=104(x1), r1=8(y1), r2=254(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 8
LDI r2, 254
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
