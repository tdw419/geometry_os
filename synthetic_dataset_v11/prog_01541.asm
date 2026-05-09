; DESCRIPTION: Composite: . Then Draws a magenta line from (93, 11) to (177, 113). Then Sets a single magenta pixel at (150, 253).
; PLAN: r0=93(x1), r1=11(y1), r2=177(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (93, 11) to (177, 113).
; PLAN: r0=93(x1), r1=11(y1), r2=177(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 11
LDI r2, 177
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (150, 253).
; PLAN: r0=150(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
