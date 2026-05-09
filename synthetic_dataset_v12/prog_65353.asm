; DESCRIPTION: Draws a red rectangle at (354, 18) with width 94 and height 92.
; PLAN: r0=354(x), r1=18(y), r2=94(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 18
LDI r2, 94
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
