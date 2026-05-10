; DESCRIPTION: Draws a purple line from (401, 185) to (462, 60).
; PLAN: r0=401(x1), r1=185(y1), r2=462(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 185
LDI r2, 462
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
