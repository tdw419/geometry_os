; DESCRIPTION: Draws a blue line from (40, 9) to (328, 126).
; PLAN: r0=40(x1), r1=9(y1), r2=328(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 9
LDI r2, 328
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
