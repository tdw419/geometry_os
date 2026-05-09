; DESCRIPTION: Draws a cyan rectangle at (34, 141) with width 69 and height 79.
; PLAN: r0=34(x), r1=141(y), r2=69(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 141
LDI r2, 69
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
