; DESCRIPTION: Draws a red rectangle at (6, 48) with width 58 and height 72.
; PLAN: r0=6(x), r1=48(y), r2=58(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 48
LDI r2, 58
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
