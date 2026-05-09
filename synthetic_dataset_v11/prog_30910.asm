; DESCRIPTION: Composite: . Then Draws a white line from (28, 167) to (46, 105). Then Places a magenta dot at position (25, 203).
; PLAN: r0=28(x1), r1=167(y1), r2=46(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=203(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (28, 167) to (46, 105).
; PLAN: r0=28(x1), r1=167(y1), r2=46(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 167
LDI r2, 46
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (25, 203).
; PLAN: r0=25(x), r1=203(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 203
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
