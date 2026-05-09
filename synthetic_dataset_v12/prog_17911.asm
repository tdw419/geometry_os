; DESCRIPTION: Draws a red rectangle at (280, 96) with width 92 and height 86.
; PLAN: r0=280(x), r1=96(y), r2=92(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 96
LDI r2, 92
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
