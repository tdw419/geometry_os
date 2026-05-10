; DESCRIPTION: Draws a white line from (234, 238) to (353, 54).
; PLAN: r0=234(x1), r1=238(y1), r2=353(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 238
LDI r2, 353
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
