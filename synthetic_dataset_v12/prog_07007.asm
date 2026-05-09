; DESCRIPTION: Draws a red rectangle at (280, 6) with width 92 and height 93.
; PLAN: r0=280(x), r1=6(y), r2=92(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 6
LDI r2, 92
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
