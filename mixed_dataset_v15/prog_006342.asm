; DESCRIPTION: Draws a green rectangle at (425, 142) with width 33 and height 111.
; PLAN: r0=425(x), r1=142(y), r2=33(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 142
LDI r2, 33
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
