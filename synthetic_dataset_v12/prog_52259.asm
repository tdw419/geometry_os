; DESCRIPTION: Draws a black rectangle at (195, 46) with width 24 and height 95.
; PLAN: r0=195(x), r1=46(y), r2=24(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 46
LDI r2, 24
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
