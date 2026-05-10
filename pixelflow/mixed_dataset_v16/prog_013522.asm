; DESCRIPTION: Draws a blue line from (262, 18) to (203, 174).
; PLAN: r0=262(x1), r1=18(y1), r2=203(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 18
LDI r2, 203
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
