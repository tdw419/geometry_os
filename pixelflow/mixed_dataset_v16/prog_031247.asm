; DESCRIPTION: Draws a blue line from (262, 134) to (353, 172).
; PLAN: r0=262(x1), r1=134(y1), r2=353(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 134
LDI r2, 353
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
