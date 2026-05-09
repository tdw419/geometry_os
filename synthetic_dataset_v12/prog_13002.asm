; DESCRIPTION: Draws a green rectangle at (281, 111) with width 37 and height 85.
; PLAN: r0=281(x), r1=111(y), r2=37(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 111
LDI r2, 37
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
