; DESCRIPTION: Draws a white rectangle at (111, 99) with width 57 and height 118.
; PLAN: r0=111(x), r1=99(y), r2=57(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 99
LDI r2, 57
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
