; DESCRIPTION: Draws a green line from (231, 31) to (309, 189).
; PLAN: r0=231(x1), r1=31(y1), r2=309(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 31
LDI r2, 309
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
