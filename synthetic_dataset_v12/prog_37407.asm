; DESCRIPTION: Draws a cyan rectangle at (111, 25) with width 24 and height 20.
; PLAN: r0=111(x), r1=25(y), r2=24(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 25
LDI r2, 24
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
