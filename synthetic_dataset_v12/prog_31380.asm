; DESCRIPTION: Draws a green rectangle at (406, 14) with width 45 and height 44.
; PLAN: r0=406(x), r1=14(y), r2=45(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 14
LDI r2, 45
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
