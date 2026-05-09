; DESCRIPTION: Draws a cyan rectangle at (144, 136) with width 99 and height 103.
; PLAN: r0=144(x), r1=136(y), r2=99(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 136
LDI r2, 99
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
