; DESCRIPTION: Draws a red rectangle at (191, 35) with width 64 and height 44.
; PLAN: r0=191(x), r1=35(y), r2=64(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 35
LDI r2, 64
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
