; DESCRIPTION: Draws a cyan rectangle at (267, 103) with width 100 and height 61.
; PLAN: r0=267(x), r1=103(y), r2=100(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 103
LDI r2, 100
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
