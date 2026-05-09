; DESCRIPTION: Draws a purple line from (232, 146) to (244, 215).
; PLAN: r0=232(x1), r1=146(y1), r2=244(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 146
LDI r2, 244
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
