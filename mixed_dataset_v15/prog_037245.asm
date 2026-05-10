; DESCRIPTION: Draws a cyan rectangle at (462, 151) with width 45 and height 15.
; PLAN: r0=462(x), r1=151(y), r2=45(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 151
LDI r2, 45
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
