; DESCRIPTION: Draws a green line from (164, 69) to (353, 18).
; PLAN: r0=164(x1), r1=69(y1), r2=353(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 69
LDI r2, 353
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
