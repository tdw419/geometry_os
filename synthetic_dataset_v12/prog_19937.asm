; DESCRIPTION: Draws a cyan rectangle at (62, 111) with width 14 and height 49.
; PLAN: r0=62(x), r1=111(y), r2=14(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 111
LDI r2, 14
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
