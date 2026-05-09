; DESCRIPTION: Draws a cyan rectangle at (240, 32) with width 55 and height 114.
; PLAN: r0=240(x), r1=32(y), r2=55(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 32
LDI r2, 55
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
