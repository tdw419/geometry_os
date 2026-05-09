; DESCRIPTION: Composite: . Then Renders a magenta box of size 40x89 starting at (161, 144). Then Places a red dot at position (53, 14).
; PLAN: r0=161(x), r1=144(y), r2=40(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=53(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 40x89 starting at (161, 144).
; PLAN: r0=161(x), r1=144(y), r2=40(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 144
LDI r2, 40
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (53, 14).
; PLAN: r0=53(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
