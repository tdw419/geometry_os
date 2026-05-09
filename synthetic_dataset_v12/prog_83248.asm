; DESCRIPTION: Draws a purple rectangle at (342, 129) with width 114 and height 111.
; PLAN: r0=342(x), r1=129(y), r2=114(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 129
LDI r2, 114
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
