; DESCRIPTION: Draws a blue rectangle at (32, 229) with width 50 and height 26.
; PLAN: r0=32(x), r1=229(y), r2=50(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 229
LDI r2, 50
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
