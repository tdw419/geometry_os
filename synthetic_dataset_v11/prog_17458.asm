; DESCRIPTION: Composite: . Then Draws a green line from (158, 5) to (101, 146). Then Sets a single black pixel at (19, 50).
; PLAN: r0=158(x1), r1=5(y1), r2=101(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=19(x), r1=50(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (158, 5) to (101, 146).
; PLAN: r0=158(x1), r1=5(y1), r2=101(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 5
LDI r2, 101
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (19, 50).
; PLAN: r0=19(x), r1=50(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 50
LDI r2, 0x000000
PSET r0, r1, r2
HALT
