; DESCRIPTION: Draws a green rectangle at (28, 173) with width 44 and height 65.
; PLAN: r0=28(x), r1=173(y), r2=44(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 173
LDI r2, 44
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
