; DESCRIPTION: Draws a red rectangle at (382, 21) with width 113 and height 55.
; PLAN: r0=382(x), r1=21(y), r2=113(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 21
LDI r2, 113
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
