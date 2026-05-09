; DESCRIPTION: Draws a cyan rectangle at (264, 168) with width 24 and height 69.
; PLAN: r0=264(x), r1=168(y), r2=24(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 168
LDI r2, 24
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
