; DESCRIPTION: Draws a green line from (26, 141) to (178, 195).
; PLAN: r0=26(x1), r1=141(y1), r2=178(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 141
LDI r2, 178
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
