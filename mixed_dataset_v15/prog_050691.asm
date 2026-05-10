; DESCRIPTION: Renders a blue line between points (328, 122) and (328, 172).
; PLAN: r0=328(x1), r1=122(y1), r2=328(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 122
LDI r2, 328
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
