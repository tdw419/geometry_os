; DESCRIPTION: Draws a green line from (464, 159) to (476, 175).
; PLAN: r0=464(x1), r1=159(y1), r2=476(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 159
LDI r2, 476
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
