; DESCRIPTION: Draws a red rectangle at (154, 48) with width 114 and height 112.
; PLAN: r0=154(x), r1=48(y), r2=114(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 48
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
