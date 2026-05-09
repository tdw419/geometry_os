; DESCRIPTION: Draws a blue rectangle at (212, 209) with width 28 and height 32.
; PLAN: r0=212(x), r1=209(y), r2=28(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 209
LDI r2, 28
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
