; DESCRIPTION: Draws a green rectangle at (111, 57) with width 21 and height 86.
; PLAN: r0=111(x), r1=57(y), r2=21(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 57
LDI r2, 21
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
