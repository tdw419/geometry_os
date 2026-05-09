; DESCRIPTION: Draws a red rectangle at (354, 240) with width 51 and height 10.
; PLAN: r0=354(x), r1=240(y), r2=51(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 240
LDI r2, 51
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
