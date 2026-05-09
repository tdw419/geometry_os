; DESCRIPTION: Composite: . Then Sets a single black pixel at (188, 243). Then Draws a red rectangle at (13, 63) with width 45 and height 55.
; PLAN: r0=188(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=13(x), r1=63(y), r2=45(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (188, 243).
; PLAN: r0=188(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 243
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (13, 63) with width 45 and height 55.
; PLAN: r0=13(x), r1=63(y), r2=45(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 63
LDI r2, 45
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
