; DESCRIPTION: Draws a blue line from (58, 208) to (166, 172).
; PLAN: r0=58(x1), r1=208(y1), r2=166(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 208
LDI r2, 166
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
