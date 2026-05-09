; DESCRIPTION: Composite: . Then Sets a single black pixel at (39, 61). Then Draws a black line from (136, 16) to (68, 69).
; PLAN: r0=39(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=136(x1), r1=16(y1), r2=68(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (39, 61).
; PLAN: r0=39(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 61
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (136, 16) to (68, 69).
; PLAN: r0=136(x1), r1=16(y1), r2=68(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 16
LDI r2, 68
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
