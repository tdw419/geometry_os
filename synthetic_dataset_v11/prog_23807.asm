; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (7, 159) with width 97 and height 77. Then Places a green dot at position (41, 135).
; PLAN: r0=7(x), r1=159(y), r2=97(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (7, 159) with width 97 and height 77.
; PLAN: r0=7(x), r1=159(y), r2=97(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 159
LDI r2, 97
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (41, 135).
; PLAN: r0=41(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
