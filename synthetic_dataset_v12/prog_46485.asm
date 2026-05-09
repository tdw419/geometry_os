; DESCRIPTION: Draws a purple rectangle at (174, 58) with width 34 and height 113.
; PLAN: r0=174(x), r1=58(y), r2=34(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 58
LDI r2, 34
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
