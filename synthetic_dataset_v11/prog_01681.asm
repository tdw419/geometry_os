; DESCRIPTION: Draws a blue rectangle at (23, 190) with width 13 and height 10.
; PLAN: r0=23(x), r1=190(y), r2=13(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 190
LDI r2, 13
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
