; DESCRIPTION: Composite: . Then Places a green dot at position (205, 172). Then Draws a black rectangle at (145, 16) with width 75 and height 28.
; PLAN: r0=205(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=145(x), r1=16(y), r2=75(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (205, 172).
; PLAN: r0=205(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (145, 16) with width 75 and height 28.
; PLAN: r0=145(x), r1=16(y), r2=75(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 16
LDI r2, 75
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
