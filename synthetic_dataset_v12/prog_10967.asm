; DESCRIPTION: Draws a red line from (438, 4) to (327, 236).
; PLAN: r0=438(x1), r1=4(y1), r2=327(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 4
LDI r2, 327
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
