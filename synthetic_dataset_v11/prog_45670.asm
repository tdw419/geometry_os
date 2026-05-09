; DESCRIPTION: Composite: . Then Places a magenta dot at position (242, 174). Then Draws a white line from (158, 178) to (155, 216).
; PLAN: r0=242(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=158(x1), r1=178(y1), r2=155(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (242, 174).
; PLAN: r0=242(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (158, 178) to (155, 216).
; PLAN: r0=158(x1), r1=178(y1), r2=155(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 178
LDI r2, 155
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
