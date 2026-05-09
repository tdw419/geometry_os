; DESCRIPTION: Draws a black line from (220, 25) to (280, 181).
; PLAN: r0=220(x1), r1=25(y1), r2=280(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 25
LDI r2, 280
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
