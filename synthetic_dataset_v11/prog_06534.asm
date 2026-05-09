; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (135, 16) with width 94 and height 17. Then Sets a single orange pixel at (51, 152).
; PLAN: r0=135(x), r1=16(y), r2=94(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x), r1=152(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (135, 16) with width 94 and height 17.
; PLAN: r0=135(x), r1=16(y), r2=94(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 16
LDI r2, 94
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (51, 152).
; PLAN: r0=51(x), r1=152(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 152
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
