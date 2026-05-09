; DESCRIPTION: Draws a cyan rectangle at (222, 24) with width 66 and height 65.
; PLAN: r0=222(x), r1=24(y), r2=66(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 24
LDI r2, 66
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
