; DESCRIPTION: Draws a purple rectangle at (143, 33) with width 113 and height 27.
; PLAN: r0=143(x), r1=33(y), r2=113(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 33
LDI r2, 113
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
