; DESCRIPTION: Draws a red rectangle at (102, 24) with width 31 and height 102.
; PLAN: r0=102(x), r1=24(y), r2=31(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 24
LDI r2, 31
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
