; DESCRIPTION: Draws a black rectangle at (187, 112) with width 113 and height 98.
; PLAN: r0=187(x), r1=112(y), r2=113(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 112
LDI r2, 113
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
