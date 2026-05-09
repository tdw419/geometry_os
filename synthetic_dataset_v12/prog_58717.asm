; DESCRIPTION: Draws a green rectangle at (391, 25) with width 14 and height 64.
; PLAN: r0=391(x), r1=25(y), r2=14(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 25
LDI r2, 14
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
