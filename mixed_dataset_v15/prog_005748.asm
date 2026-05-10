; DESCRIPTION: Draws a blue line from (466, 77) to (243, 64).
; PLAN: r0=466(x1), r1=77(y1), r2=243(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 77
LDI r2, 243
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
