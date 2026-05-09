; DESCRIPTION: Draws a blue line from (348, 243) to (284, 122).
; PLAN: r0=348(x1), r1=243(y1), r2=284(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 243
LDI r2, 284
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
