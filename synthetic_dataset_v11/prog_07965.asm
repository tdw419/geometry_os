; DESCRIPTION: Composite: . Then Places a blue dot at position (217, 10). Then Draws a purple line from (135, 114) to (223, 126).
; PLAN: r0=217(x), r1=10(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=135(x1), r1=114(y1), r2=223(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (217, 10).
; PLAN: r0=217(x), r1=10(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 10
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (135, 114) to (223, 126).
; PLAN: r0=135(x1), r1=114(y1), r2=223(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 114
LDI r2, 223
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
