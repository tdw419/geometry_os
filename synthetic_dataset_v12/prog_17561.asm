; DESCRIPTION: Draws a blue line from (291, 237) to (480, 72).
; PLAN: r0=291(x1), r1=237(y1), r2=480(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 237
LDI r2, 480
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
