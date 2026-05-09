; DESCRIPTION: Draws a red rectangle at (77, 77) with width 28 and height 120.
; PLAN: r0=77(x), r1=77(y), r2=28(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 77
LDI r2, 28
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
