; DESCRIPTION: Draws a red rectangle at (307, 139) with width 87 and height 33.
; PLAN: r0=307(x), r1=139(y), r2=87(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 139
LDI r2, 87
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
