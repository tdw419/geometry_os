; DESCRIPTION: Draws a red rectangle at (0, 57) with width 16 and height 96.
; PLAN: r0=0(x), r1=57(y), r2=16(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 57
LDI r2, 16
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
