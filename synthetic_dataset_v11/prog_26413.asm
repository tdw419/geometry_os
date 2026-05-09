; DESCRIPTION: Composite: . Then Places a purple dot at position (151, 15). Then Draws a black line from (2, 116) to (53, 70).
; PLAN: r0=151(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=2(x1), r1=116(y1), r2=53(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (151, 15).
; PLAN: r0=151(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (2, 116) to (53, 70).
; PLAN: r0=2(x1), r1=116(y1), r2=53(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 116
LDI r2, 53
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
