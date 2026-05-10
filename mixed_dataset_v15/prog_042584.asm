; DESCRIPTION: Draws a black rectangle at (368, 171) with width 34 and height 66.
; PLAN: r0=368(x), r1=171(y), r2=34(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 171
LDI r2, 34
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
