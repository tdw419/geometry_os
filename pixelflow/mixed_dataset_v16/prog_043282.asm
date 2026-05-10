; DESCRIPTION: Draws a cyan rectangle at (246, 142) with width 14 and height 111.
; PLAN: r0=246(x), r1=142(y), r2=14(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 142
LDI r2, 14
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
