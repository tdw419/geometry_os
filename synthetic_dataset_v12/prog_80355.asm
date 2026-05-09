; DESCRIPTION: Draws a cyan rectangle at (39, 176) with width 105 and height 24.
; PLAN: r0=39(x), r1=176(y), r2=105(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 176
LDI r2, 105
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
