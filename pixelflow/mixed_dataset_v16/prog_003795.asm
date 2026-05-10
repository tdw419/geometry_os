; DESCRIPTION: Draws a blue line from (263, 96) to (325, 240).
; PLAN: r0=263(x1), r1=96(y1), r2=325(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 96
LDI r2, 325
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
