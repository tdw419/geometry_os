; DESCRIPTION: Draws a red rectangle at (48, 81) with width 59 and height 105.
; PLAN: r0=48(x), r1=81(y), r2=59(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 81
LDI r2, 59
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
