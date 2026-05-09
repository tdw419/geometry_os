; DESCRIPTION: Draws a blue line from (28, 7) to (33, 103).
; PLAN: r0=28(x1), r1=7(y1), r2=33(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 7
LDI r2, 33
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
