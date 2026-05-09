; DESCRIPTION: Draws a cyan rectangle at (69, 164) with width 68 and height 22.
; PLAN: r0=69(x), r1=164(y), r2=68(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 164
LDI r2, 68
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
