; DESCRIPTION: Draws a black rectangle at (60, 0) with width 37 and height 48.
; PLAN: r0=60(x), r1=0(y), r2=37(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 0
LDI r2, 37
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
