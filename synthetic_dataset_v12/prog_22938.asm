; DESCRIPTION: Draws a green line from (72, 244) to (297, 91).
; PLAN: r0=72(x1), r1=244(y1), r2=297(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 244
LDI r2, 297
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
