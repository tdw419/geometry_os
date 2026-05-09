; DESCRIPTION: Composite: . Then Renders a green box of size 105x57 starting at (74, 160). Then Places a purple dot at position (101, 230).
; PLAN: r0=74(x), r1=160(y), r2=105(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 105x57 starting at (74, 160).
; PLAN: r0=74(x), r1=160(y), r2=105(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 160
LDI r2, 105
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (101, 230).
; PLAN: r0=101(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
