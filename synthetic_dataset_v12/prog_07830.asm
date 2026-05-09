; DESCRIPTION: Draws a blue rectangle at (207, 46) with width 32 and height 100.
; PLAN: r0=207(x), r1=46(y), r2=32(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 46
LDI r2, 32
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
