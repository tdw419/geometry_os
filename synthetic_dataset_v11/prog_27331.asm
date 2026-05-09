; DESCRIPTION: Draws a blue rectangle at (32, 186) with width 37 and height 16.
; PLAN: r0=32(x), r1=186(y), r2=37(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 186
LDI r2, 37
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
