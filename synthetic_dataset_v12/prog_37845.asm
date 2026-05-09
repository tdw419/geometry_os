; DESCRIPTION: Draws a cyan rectangle at (69, 141) with width 69 and height 71.
; PLAN: r0=69(x), r1=141(y), r2=69(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 141
LDI r2, 69
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
