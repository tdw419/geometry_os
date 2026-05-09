; DESCRIPTION: Draws a green rectangle at (96, 13) with width 48 and height 16.
; PLAN: r0=96(x), r1=13(y), r2=48(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 13
LDI r2, 48
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
