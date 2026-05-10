; DESCRIPTION: Draws a black rectangle at (174, 187) with width 21 and height 68.
; PLAN: r0=174(x), r1=187(y), r2=21(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 187
LDI r2, 21
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
