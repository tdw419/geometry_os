; DESCRIPTION: Draws a green line from (297, 154) to (244, 80).
; PLAN: r0=297(x1), r1=154(y1), r2=244(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 154
LDI r2, 244
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
