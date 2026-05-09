; DESCRIPTION: Draws a green rectangle at (354, 73) with width 56 and height 16.
; PLAN: r0=354(x), r1=73(y), r2=56(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 73
LDI r2, 56
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
