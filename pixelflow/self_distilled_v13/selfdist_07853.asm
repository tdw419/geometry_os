; DESCRIPTION: Draws a blue line from (187, 165) to (40, 12).
; PLAN: r0=187(x1), r1=165(y1), r2=40(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 165
LDI r2, 40
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
