; DESCRIPTION: Draws a red rectangle at (92, 126) with width 90 and height 97.
; PLAN: r0=92(x), r1=126(y), r2=90(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 126
LDI r2, 90
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
