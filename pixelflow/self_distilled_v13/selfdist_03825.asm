; DESCRIPTION: Draws a cyan rectangle at (240, 50) with width 20 and height 39.
; PLAN: r0=240(x), r1=50(y), r2=20(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 50
LDI r2, 20
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
