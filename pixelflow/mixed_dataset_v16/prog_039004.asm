; DESCRIPTION: Draws a red rectangle at (86, 0) with width 100 and height 27.
; PLAN: r0=86(x), r1=0(y), r2=100(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 0
LDI r2, 100
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
