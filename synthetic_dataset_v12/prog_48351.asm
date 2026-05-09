; DESCRIPTION: Draws a cyan rectangle at (253, 174) with width 26 and height 53.
; PLAN: r0=253(x), r1=174(y), r2=26(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 174
LDI r2, 26
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
