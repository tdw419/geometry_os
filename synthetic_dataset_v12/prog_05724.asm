; DESCRIPTION: Draws a green line from (431, 107) to (319, 68).
; PLAN: r0=431(x1), r1=107(y1), r2=319(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 107
LDI r2, 319
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
