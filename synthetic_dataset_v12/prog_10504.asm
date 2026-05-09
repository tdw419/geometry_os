; DESCRIPTION: Draws a green line from (38, 178) to (256, 90).
; PLAN: r0=38(x1), r1=178(y1), r2=256(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 178
LDI r2, 256
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
