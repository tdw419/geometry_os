; DESCRIPTION: Draws a cyan rectangle at (132, 95) with width 69 and height 107.
; PLAN: r0=132(x), r1=95(y), r2=69(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 95
LDI r2, 69
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
