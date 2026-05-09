; DESCRIPTION: Draws a white rectangle at (354, 7) with width 25 and height 92.
; PLAN: r0=354(x), r1=7(y), r2=25(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 7
LDI r2, 25
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
