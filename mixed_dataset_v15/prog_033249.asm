; DESCRIPTION: Draws a blue rectangle at (367, 13) with width 27 and height 86.
; PLAN: r0=367(x), r1=13(y), r2=27(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 13
LDI r2, 27
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
