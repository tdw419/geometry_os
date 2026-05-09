; DESCRIPTION: Draws a red rectangle at (415, 3) with width 72 and height 115.
; PLAN: r0=415(x), r1=3(y), r2=72(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 3
LDI r2, 72
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
