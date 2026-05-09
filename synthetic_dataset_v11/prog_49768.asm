; DESCRIPTION: Composite: . Then Draws a purple rectangle at (37, 166) with width 38 and height 86. Then Places a blue dot at position (154, 19).
; PLAN: r0=37(x), r1=166(y), r2=38(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=154(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (37, 166) with width 38 and height 86.
; PLAN: r0=37(x), r1=166(y), r2=38(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 166
LDI r2, 38
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (154, 19).
; PLAN: r0=154(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
