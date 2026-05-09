; DESCRIPTION: Composite: . Then Places a red dot at position (36, 211). Then Draws a black line from (122, 133) to (240, 30).
; PLAN: r0=36(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=122(x1), r1=133(y1), r2=240(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (36, 211).
; PLAN: r0=36(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 211
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (122, 133) to (240, 30).
; PLAN: r0=122(x1), r1=133(y1), r2=240(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 133
LDI r2, 240
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
