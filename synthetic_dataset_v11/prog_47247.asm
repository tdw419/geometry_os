; DESCRIPTION: Composite: . Then Renders a yellow box of size 37x106 starting at (161, 129). Then Places a purple dot at position (151, 85).
; PLAN: r0=161(x), r1=129(y), r2=37(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 37x106 starting at (161, 129).
; PLAN: r0=161(x), r1=129(y), r2=37(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 129
LDI r2, 37
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (151, 85).
; PLAN: r0=151(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
