; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (177, 97) with width 78 and height 83. Then Places a cyan dot at position (135, 120).
; PLAN: r0=177(x), r1=97(y), r2=78(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=135(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (177, 97) with width 78 and height 83.
; PLAN: r0=177(x), r1=97(y), r2=78(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 97
LDI r2, 78
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (135, 120).
; PLAN: r0=135(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 120
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
