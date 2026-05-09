; DESCRIPTION: Draws a yellow rectangle at (267, 171) with width 113 and height 65.
; PLAN: r0=267(x), r1=171(y), r2=113(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 171
LDI r2, 113
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
