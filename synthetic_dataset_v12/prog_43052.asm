; DESCRIPTION: Draws a cyan rectangle at (21, 69) with width 60 and height 15.
; PLAN: r0=21(x), r1=69(y), r2=60(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 69
LDI r2, 60
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
