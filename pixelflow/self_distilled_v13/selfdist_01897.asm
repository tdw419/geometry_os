; DESCRIPTION: Draws a red rectangle at (291, 177) with width 49 and height 11.
; PLAN: r0=291(x), r1=177(y), r2=49(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 177
LDI r2, 49
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
