; DESCRIPTION: Draws a blue rectangle at (330, 182) with width 54 and height 39.
; PLAN: r0=330(x), r1=182(y), r2=54(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 182
LDI r2, 54
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
