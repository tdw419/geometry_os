; DESCRIPTION: Draws a blue line from (437, 122) to (268, 202).
; PLAN: r0=437(x1), r1=122(y1), r2=268(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 122
LDI r2, 268
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
