; DESCRIPTION: Draws a blue line from (45, 152) to (117, 0).
; PLAN: r0=45(x1), r1=152(y1), r2=117(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 152
LDI r2, 117
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
