; DESCRIPTION: Draws a green rectangle at (346, 70) with width 102 and height 92.
; PLAN: r0=346(x), r1=70(y), r2=102(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 70
LDI r2, 102
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
