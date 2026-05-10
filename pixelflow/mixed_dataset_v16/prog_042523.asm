; DESCRIPTION: Draws a cyan rectangle at (35, 166) with width 63 and height 40.
; PLAN: r0=35(x), r1=166(y), r2=63(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 166
LDI r2, 63
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
