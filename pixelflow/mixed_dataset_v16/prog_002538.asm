; DESCRIPTION: Draws a red rectangle at (415, 139) with width 22 and height 102.
; PLAN: r0=415(x), r1=139(y), r2=22(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 139
LDI r2, 22
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
