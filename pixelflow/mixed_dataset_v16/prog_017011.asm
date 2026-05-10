; DESCRIPTION: Draws a green rectangle at (117, 10) with width 120 and height 13.
; PLAN: r0=117(x), r1=10(y), r2=120(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 10
LDI r2, 120
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
