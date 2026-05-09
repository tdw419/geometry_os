; DESCRIPTION: Draws a purple rectangle at (182, 111) with width 23 and height 44.
; PLAN: r0=182(x), r1=111(y), r2=23(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 111
LDI r2, 23
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
