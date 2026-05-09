; DESCRIPTION: Composite: . Then Places a red dot at position (96, 158). Then Renders a purple box of size 115x86 starting at (66, 136).
; PLAN: r0=96(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=66(x), r1=136(y), r2=115(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (96, 158).
; PLAN: r0=96(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 115x86 starting at (66, 136).
; PLAN: r0=66(x), r1=136(y), r2=115(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 136
LDI r2, 115
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
