; DESCRIPTION: Draws a magenta line from (507, 220) to (104, 7).
; PLAN: r0=507(x1), r1=220(y1), r2=104(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 220
LDI r2, 104
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
