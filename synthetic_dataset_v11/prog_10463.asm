; DESCRIPTION: Draws a cyan rectangle at (98, 94) with width 111 and height 67.
; PLAN: r0=98(x), r1=94(y), r2=111(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 94
LDI r2, 111
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
