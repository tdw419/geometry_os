; DESCRIPTION: Composite: . Then Draws a purple line from (221, 209) to (133, 156). Then Places a black dot at position (192, 20).
; PLAN: r0=221(x1), r1=209(y1), r2=133(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (221, 209) to (133, 156).
; PLAN: r0=221(x1), r1=209(y1), r2=133(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 209
LDI r2, 133
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (192, 20).
; PLAN: r0=192(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
HALT
