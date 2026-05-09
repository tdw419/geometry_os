; DESCRIPTION: Draws a red rectangle at (37, 177) with width 60 and height 73.
; PLAN: r0=37(x), r1=177(y), r2=60(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 177
LDI r2, 60
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
