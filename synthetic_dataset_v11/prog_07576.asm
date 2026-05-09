; DESCRIPTION: Composite: . Then Draws a orange rectangle at (47, 145) with width 89 and height 32. Then Places a magenta dot at position (210, 71).
; PLAN: r0=47(x), r1=145(y), r2=89(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=210(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (47, 145) with width 89 and height 32.
; PLAN: r0=47(x), r1=145(y), r2=89(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 145
LDI r2, 89
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (210, 71).
; PLAN: r0=210(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
