; DESCRIPTION: Draws a green line from (296, 195) to (438, 69).
; PLAN: r0=296(x1), r1=195(y1), r2=438(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 195
LDI r2, 438
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
