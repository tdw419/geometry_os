; DESCRIPTION: Draws a cyan rectangle at (411, 213) with width 69 and height 26.
; PLAN: r0=411(x), r1=213(y), r2=69(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 213
LDI r2, 69
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
