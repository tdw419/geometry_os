; DESCRIPTION: Draws a blue line from (71, 25) to (113, 179).
; PLAN: r0=71(x1), r1=25(y1), r2=113(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 25
LDI r2, 113
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
