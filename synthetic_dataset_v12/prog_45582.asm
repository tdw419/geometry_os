; DESCRIPTION: Draws a cyan rectangle at (101, 194) with width 13 and height 35.
; PLAN: r0=101(x), r1=194(y), r2=13(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 194
LDI r2, 13
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
