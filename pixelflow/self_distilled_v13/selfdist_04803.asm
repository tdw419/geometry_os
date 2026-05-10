; DESCRIPTION: Draws a blue line from (187, 103) to (45, 103).
; PLAN: r0=187(x1), r1=103(y1), r2=45(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 103
LDI r2, 45
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
