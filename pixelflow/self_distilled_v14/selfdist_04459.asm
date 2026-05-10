; DESCRIPTION: Draws a cyan rectangle at (43, 88) with width 77 and height 120.
; PLAN: r0=43(x), r1=88(y), r2=77(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 88
LDI r2, 77
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
