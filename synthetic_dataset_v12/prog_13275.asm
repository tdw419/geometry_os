; DESCRIPTION: Draws a blue line from (402, 126) to (175, 178).
; PLAN: r0=402(x1), r1=126(y1), r2=175(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 126
LDI r2, 175
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
