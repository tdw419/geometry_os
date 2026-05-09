; DESCRIPTION: Draws a cyan rectangle at (43, 111) with width 16 and height 105.
; PLAN: r0=43(x), r1=111(y), r2=16(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 111
LDI r2, 16
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
