; DESCRIPTION: Draws a green rectangle at (152, 30) with width 32 and height 17.
; PLAN: r0=152(x), r1=30(y), r2=32(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 30
LDI r2, 32
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
