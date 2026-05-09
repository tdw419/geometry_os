; DESCRIPTION: Composite: . Then Draws a purple line from (195, 139) to (152, 132). Then Places a red dot at position (40, 42).
; PLAN: r0=195(x1), r1=139(y1), r2=152(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=40(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (195, 139) to (152, 132).
; PLAN: r0=195(x1), r1=139(y1), r2=152(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 139
LDI r2, 152
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (40, 42).
; PLAN: r0=40(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 42
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
