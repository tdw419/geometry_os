; DESCRIPTION: Draws a cyan rectangle at (107, 90) with width 38 and height 111.
; PLAN: r0=107(x), r1=90(y), r2=38(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 90
LDI r2, 38
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
