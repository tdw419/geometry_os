; DESCRIPTION: Draws a red rectangle at (176, 13) with width 92 and height 24.
; PLAN: r0=176(x), r1=13(y), r2=92(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 13
LDI r2, 92
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
