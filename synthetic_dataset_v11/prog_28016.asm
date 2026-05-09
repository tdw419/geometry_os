; DESCRIPTION: Composite: . Then Places a black dot at position (34, 220). Then Draws a magenta rectangle at (81, 164) with width 71 and height 45.
; PLAN: r0=34(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=164(y), r2=71(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (34, 220).
; PLAN: r0=34(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (81, 164) with width 71 and height 45.
; PLAN: r0=81(x), r1=164(y), r2=71(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 164
LDI r2, 71
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
