; DESCRIPTION: Draws a cyan line from (287, 156) to (21, 129).
; PLAN: r0=287(x1), r1=156(y1), r2=21(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 156
LDI r2, 21
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
