; DESCRIPTION: Draws a red rectangle at (207, 48) with width 30 and height 119.
; PLAN: r0=207(x), r1=48(y), r2=30(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 48
LDI r2, 30
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
