; DESCRIPTION: Draws a cyan rectangle at (91, 120) with width 75 and height 88.
; PLAN: r0=91(x), r1=120(y), r2=75(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 120
LDI r2, 75
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
