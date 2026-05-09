; DESCRIPTION: Draws a purple line from (244, 69) to (171, 37).
; PLAN: r0=244(x1), r1=69(y1), r2=171(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 69
LDI r2, 171
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
