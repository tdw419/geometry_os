; DESCRIPTION: Draws a green rectangle at (50, 128) with width 27 and height 63.
; PLAN: r0=50(x), r1=128(y), r2=27(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 128
LDI r2, 27
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
