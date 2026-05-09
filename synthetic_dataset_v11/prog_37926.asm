; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (226, 113). Then Draws a magenta rectangle at (44, 122) with width 72 and height 36.
; PLAN: r0=226(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=44(x), r1=122(y), r2=72(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (226, 113).
; PLAN: r0=226(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 113
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (44, 122) with width 72 and height 36.
; PLAN: r0=44(x), r1=122(y), r2=72(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 122
LDI r2, 72
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
