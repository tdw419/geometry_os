; DESCRIPTION: Draws a green rectangle at (228, 0) with width 60 and height 92.
; PLAN: r0=228(x), r1=0(y), r2=60(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 0
LDI r2, 60
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
