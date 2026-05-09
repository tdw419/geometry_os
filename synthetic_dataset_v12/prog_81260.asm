; DESCRIPTION: Draws a cyan rectangle at (311, 151) with width 23 and height 47.
; PLAN: r0=311(x), r1=151(y), r2=23(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 151
LDI r2, 23
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
