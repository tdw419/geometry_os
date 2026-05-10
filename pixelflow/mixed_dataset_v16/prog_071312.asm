; DESCRIPTION: Draws a yellow line from (243, 76) to (96, 67).
; PLAN: r0=243(x1), r1=76(y1), r2=96(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 76
LDI r2, 96
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
