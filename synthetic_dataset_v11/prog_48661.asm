; DESCRIPTION: Draws a green rectangle at (146, 32) with width 96 and height 87.
; PLAN: r0=146(x), r1=32(y), r2=96(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 32
LDI r2, 96
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
