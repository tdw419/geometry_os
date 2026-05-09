; DESCRIPTION: Composite: . Then Sets a single orange pixel at (21, 92). Then Draws a green rectangle at (135, 69) with width 58 and height 63.
; PLAN: r0=21(x), r1=92(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=69(y), r2=58(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (21, 92).
; PLAN: r0=21(x), r1=92(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 92
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (135, 69) with width 58 and height 63.
; PLAN: r0=135(x), r1=69(y), r2=58(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 69
LDI r2, 58
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
