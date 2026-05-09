; DESCRIPTION: Composite: . Then Places a purple dot at position (143, 29). Then Draws a yellow line from (7, 49) to (3, 221).
; PLAN: r0=143(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=7(x1), r1=49(y1), r2=3(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (143, 29).
; PLAN: r0=143(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 29
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (7, 49) to (3, 221).
; PLAN: r0=7(x1), r1=49(y1), r2=3(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 49
LDI r2, 3
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
