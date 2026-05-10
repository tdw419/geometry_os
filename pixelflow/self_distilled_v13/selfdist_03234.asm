; DESCRIPTION: Draws a orange rectangle at (167, 112) with width 71 and height 104.
; PLAN: r0=167(x), r1=112(y), r2=71(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 112
LDI r2, 71
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
