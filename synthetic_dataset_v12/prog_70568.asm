; DESCRIPTION: Draws a red rectangle at (405, 94) with width 92 and height 22.
; PLAN: r0=405(x), r1=94(y), r2=92(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 94
LDI r2, 92
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
