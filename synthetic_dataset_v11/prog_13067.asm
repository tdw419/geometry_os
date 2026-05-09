; DESCRIPTION: Draws a red rectangle at (77, 90) with width 86 and height 55.
; PLAN: r0=77(x), r1=90(y), r2=86(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 90
LDI r2, 86
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
