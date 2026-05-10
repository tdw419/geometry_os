; DESCRIPTION: Draws a cyan rectangle at (267, 176) with width 55 and height 71.
; PLAN: r0=267(x), r1=176(y), r2=55(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 176
LDI r2, 55
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
