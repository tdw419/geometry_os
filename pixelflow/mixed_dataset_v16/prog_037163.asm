; DESCRIPTION: Draws a red rectangle at (265, 80) with width 40 and height 113.
; PLAN: r0=265(x), r1=80(y), r2=40(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 80
LDI r2, 40
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
