; DESCRIPTION: Composite: . Then Places a magenta dot at position (216, 170). Then Places a magenta 109x65 rectangle at position (3, 23).
; PLAN: r0=216(x), r1=170(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=3(x), r1=23(y), r2=109(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (216, 170).
; PLAN: r0=216(x), r1=170(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 170
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 109x65 rectangle at position (3, 23).
; PLAN: r0=3(x), r1=23(y), r2=109(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 23
LDI r2, 109
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
