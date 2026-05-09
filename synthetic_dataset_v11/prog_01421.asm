; DESCRIPTION: Draws a purple line from (239, 21) to (79, 29).
; PLAN: r0=239(x1), r1=21(y1), r2=79(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 21
LDI r2, 79
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
