; DESCRIPTION: Draws a black rectangle at (391, 130) with width 76 and height 70.
; PLAN: r0=391(x), r1=130(y), r2=76(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 130
LDI r2, 76
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
