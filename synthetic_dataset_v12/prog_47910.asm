; DESCRIPTION: Draws a green line from (501, 202) to (319, 248).
; PLAN: r0=501(x1), r1=202(y1), r2=319(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 202
LDI r2, 319
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
