; DESCRIPTION: Composite: . Then Draws a black rectangle at (89, 154) with width 120 and height 65. Then Places a magenta dot at position (60, 151).
; PLAN: r0=89(x), r1=154(y), r2=120(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=60(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (89, 154) with width 120 and height 65.
; PLAN: r0=89(x), r1=154(y), r2=120(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 154
LDI r2, 120
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (60, 151).
; PLAN: r0=60(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
