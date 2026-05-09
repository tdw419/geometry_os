; DESCRIPTION: Draws a green line from (337, 83) to (164, 40).
; PLAN: r0=337(x1), r1=83(y1), r2=164(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 83
LDI r2, 164
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
