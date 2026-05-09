; DESCRIPTION: Draws a cyan rectangle at (2, 135) with width 91 and height 47.
; PLAN: r0=2(x), r1=135(y), r2=91(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 135
LDI r2, 91
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
