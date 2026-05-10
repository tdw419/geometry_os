; DESCRIPTION: Draws a cyan rectangle at (304, 181) with width 17 and height 75.
; PLAN: r0=304(x), r1=181(y), r2=17(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 181
LDI r2, 17
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
