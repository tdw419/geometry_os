; DESCRIPTION: Draws a green line from (157, 163) to (178, 200).
; PLAN: r0=157(x1), r1=163(y1), r2=178(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 163
LDI r2, 178
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
