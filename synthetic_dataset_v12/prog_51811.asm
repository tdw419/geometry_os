; DESCRIPTION: Draws a cyan rectangle at (321, 140) with width 67 and height 91.
; PLAN: r0=321(x), r1=140(y), r2=67(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 140
LDI r2, 67
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
