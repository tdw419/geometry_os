; DESCRIPTION: Draws a red rectangle at (382, 1) with width 98 and height 39.
; PLAN: r0=382(x), r1=1(y), r2=98(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 1
LDI r2, 98
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
