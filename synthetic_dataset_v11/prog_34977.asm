; DESCRIPTION: Draws a blue line from (104, 126) to (231, 33).
; PLAN: r0=104(x1), r1=126(y1), r2=231(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 126
LDI r2, 231
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
