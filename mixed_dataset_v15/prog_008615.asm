; DESCRIPTION: Draws a blue line from (243, 96) to (114, 64).
; PLAN: r0=243(x1), r1=96(y1), r2=114(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 96
LDI r2, 114
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
