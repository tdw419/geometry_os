; DESCRIPTION: Draws a blue line from (262, 134) to (503, 99).
; PLAN: r0=262(x1), r1=134(y1), r2=503(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 134
LDI r2, 503
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
