; DESCRIPTION: Draws a cyan rectangle at (187, 48) with width 69 and height 90.
; PLAN: r0=187(x), r1=48(y), r2=69(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 48
LDI r2, 69
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
