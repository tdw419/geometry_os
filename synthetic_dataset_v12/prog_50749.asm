; DESCRIPTION: Draws a cyan rectangle at (26, 188) with width 47 and height 48.
; PLAN: r0=26(x), r1=188(y), r2=47(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 188
LDI r2, 47
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
