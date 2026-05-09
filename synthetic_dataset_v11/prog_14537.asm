; DESCRIPTION: Draws a yellow line from (156, 231) to (195, 115).
; PLAN: r0=156(x1), r1=231(y1), r2=195(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 231
LDI r2, 195
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
