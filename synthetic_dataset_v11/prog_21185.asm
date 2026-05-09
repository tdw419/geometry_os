; DESCRIPTION: Draws a black rectangle at (49, 163) with width 120 and height 57.
; PLAN: r0=49(x), r1=163(y), r2=120(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 163
LDI r2, 120
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
