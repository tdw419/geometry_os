; DESCRIPTION: Draws a green rectangle at (128, 183) with width 91 and height 48.
; PLAN: r0=128(x), r1=183(y), r2=91(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 183
LDI r2, 91
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
