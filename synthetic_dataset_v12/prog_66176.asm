; DESCRIPTION: Draws a magenta line from (507, 208) to (375, 162).
; PLAN: r0=507(x1), r1=208(y1), r2=375(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 208
LDI r2, 375
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
