; DESCRIPTION: Draws a cyan rectangle at (20, 189) with width 75 and height 21.
; PLAN: r0=20(x), r1=189(y), r2=75(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 189
LDI r2, 75
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
