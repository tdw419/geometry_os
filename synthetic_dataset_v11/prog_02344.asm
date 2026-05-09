; DESCRIPTION: Draws a cyan rectangle at (183, 23) with width 68 and height 65.
; PLAN: r0=183(x), r1=23(y), r2=68(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 23
LDI r2, 68
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
