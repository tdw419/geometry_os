; DESCRIPTION: Draws a yellow rectangle at (75, 117) with width 48 and height 13.
; PLAN: r0=75(x), r1=117(y), r2=48(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 117
LDI r2, 48
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
