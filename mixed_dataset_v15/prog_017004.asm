; DESCRIPTION: Draws a green line from (391, 200) to (16, 53).
; PLAN: r0=391(x1), r1=200(y1), r2=16(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 200
LDI r2, 16
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
