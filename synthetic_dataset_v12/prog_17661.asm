; DESCRIPTION: Draws a green rectangle at (213, 61) with width 99 and height 17.
; PLAN: r0=213(x), r1=61(y), r2=99(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 61
LDI r2, 99
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
