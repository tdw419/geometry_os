; DESCRIPTION: Draws a yellow line from (135, 237) to (442, 18).
; PLAN: r0=135(x1), r1=237(y1), r2=442(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 237
LDI r2, 442
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
