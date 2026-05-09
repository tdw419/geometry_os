; DESCRIPTION: Draws a purple line from (308, 195) to (380, 175).
; PLAN: r0=308(x1), r1=195(y1), r2=380(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 195
LDI r2, 380
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
