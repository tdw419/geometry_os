; DESCRIPTION: Draws a blue rectangle at (418, 10) with width 65 and height 85.
; PLAN: r0=418(x), r1=10(y), r2=65(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 10
LDI r2, 65
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
