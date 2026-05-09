; DESCRIPTION: Draws a cyan rectangle at (267, 217) with width 10 and height 18.
; PLAN: r0=267(x), r1=217(y), r2=10(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 217
LDI r2, 10
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
