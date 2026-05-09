; DESCRIPTION: Draws a green line from (438, 34) to (408, 167).
; PLAN: r0=438(x1), r1=34(y1), r2=408(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 34
LDI r2, 408
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
