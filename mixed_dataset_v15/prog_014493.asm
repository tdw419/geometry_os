; DESCRIPTION: Draws a red rectangle at (280, 107) with width 36 and height 89.
; PLAN: r0=280(x), r1=107(y), r2=36(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 107
LDI r2, 36
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
