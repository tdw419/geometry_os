; DESCRIPTION: Draws a cyan rectangle at (108, 88) with width 10 and height 75.
; PLAN: r0=108(x), r1=88(y), r2=10(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 88
LDI r2, 10
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
