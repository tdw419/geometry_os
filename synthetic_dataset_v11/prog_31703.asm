; DESCRIPTION: Draws a blue line from (225, 117) to (30, 249).
; PLAN: r0=225(x1), r1=117(y1), r2=30(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 117
LDI r2, 30
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
