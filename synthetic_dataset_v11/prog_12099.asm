; DESCRIPTION: Draws a blue rectangle at (150, 31) with width 103 and height 27.
; PLAN: r0=150(x), r1=31(y), r2=103(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 31
LDI r2, 103
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
