; DESCRIPTION: Draws a white line from (469, 195) to (309, 118).
; PLAN: r0=469(x1), r1=195(y1), r2=309(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 195
LDI r2, 309
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
