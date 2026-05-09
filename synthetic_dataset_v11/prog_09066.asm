; DESCRIPTION: Draws a cyan rectangle at (91, 194) with width 18 and height 62.
; PLAN: r0=91(x), r1=194(y), r2=18(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 194
LDI r2, 18
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
