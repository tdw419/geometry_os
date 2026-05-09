; DESCRIPTION: Draws a cyan rectangle at (267, 150) with width 68 and height 26.
; PLAN: r0=267(x), r1=150(y), r2=68(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 150
LDI r2, 68
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
