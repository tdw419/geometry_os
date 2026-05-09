; DESCRIPTION: Draws a red rectangle at (215, 98) with width 26 and height 119.
; PLAN: r0=215(x), r1=98(y), r2=26(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 98
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
