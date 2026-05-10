; DESCRIPTION: Draws a cyan rectangle at (364, 159) with width 59 and height 46.
; PLAN: r0=364(x), r1=159(y), r2=59(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 159
LDI r2, 59
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
