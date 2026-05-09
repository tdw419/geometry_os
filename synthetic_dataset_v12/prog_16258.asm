; DESCRIPTION: Draws a cyan rectangle at (287, 103) with width 24 and height 97.
; PLAN: r0=287(x), r1=103(y), r2=24(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 103
LDI r2, 24
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
