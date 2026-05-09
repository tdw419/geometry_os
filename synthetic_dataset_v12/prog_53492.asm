; DESCRIPTION: Draws a red rectangle at (445, 14) with width 49 and height 72.
; PLAN: r0=445(x), r1=14(y), r2=49(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 14
LDI r2, 49
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
