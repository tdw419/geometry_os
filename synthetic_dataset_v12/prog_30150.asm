; DESCRIPTION: Draws a red rectangle at (289, 107) with width 73 and height 59.
; PLAN: r0=289(x), r1=107(y), r2=73(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 107
LDI r2, 73
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
