; DESCRIPTION: Draws a blue rectangle at (406, 24) with width 68 and height 90.
; PLAN: r0=406(x), r1=24(y), r2=68(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 24
LDI r2, 68
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
