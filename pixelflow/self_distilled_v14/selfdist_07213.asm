; DESCRIPTION: Draws a red rectangle at (240, 112) with width 34 and height 77.
; PLAN: r0=240(x), r1=112(y), r2=34(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 112
LDI r2, 34
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
