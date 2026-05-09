; DESCRIPTION: Composite: . Then Places a red dot at position (140, 63). Then Draws a green line from (74, 12) to (44, 90).
; PLAN: r0=140(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=74(x1), r1=12(y1), r2=44(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (140, 63).
; PLAN: r0=140(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (74, 12) to (44, 90).
; PLAN: r0=74(x1), r1=12(y1), r2=44(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 12
LDI r2, 44
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
