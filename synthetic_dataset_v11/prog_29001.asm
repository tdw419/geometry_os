; DESCRIPTION: Composite: . Then Draws a green line from (53, 38) to (114, 44). Then Places a purple dot at position (249, 54).
; PLAN: r0=53(x1), r1=38(y1), r2=114(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=249(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (53, 38) to (114, 44).
; PLAN: r0=53(x1), r1=38(y1), r2=114(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 38
LDI r2, 114
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (249, 54).
; PLAN: r0=249(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 54
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
