; DESCRIPTION: Composite: . Then Draws a purple line from (36, 70) to (136, 25). Then Places a blue dot at position (103, 128).
; PLAN: r0=36(x1), r1=70(y1), r2=136(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (36, 70) to (136, 25).
; PLAN: r0=36(x1), r1=70(y1), r2=136(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 70
LDI r2, 136
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (103, 128).
; PLAN: r0=103(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
