; DESCRIPTION: Draws a cyan line from (97, 246) to (227, 200).
; PLAN: r0=97(x1), r1=246(y1), r2=227(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 246
LDI r2, 227
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
