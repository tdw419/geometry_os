; DESCRIPTION: Draws a green rectangle at (137, 197) with width 65 and height 45.
; PLAN: r0=137(x), r1=197(y), r2=65(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 197
LDI r2, 65
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
