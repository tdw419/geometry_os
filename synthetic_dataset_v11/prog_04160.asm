; DESCRIPTION: Composite: . Then Renders a magenta box of size 113x79 starting at (51, 122). Then Places a purple dot at position (134, 67).
; PLAN: r0=51(x), r1=122(y), r2=113(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=67(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 113x79 starting at (51, 122).
; PLAN: r0=51(x), r1=122(y), r2=113(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 122
LDI r2, 113
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (134, 67).
; PLAN: r0=134(x), r1=67(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 67
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
