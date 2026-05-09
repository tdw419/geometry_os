; DESCRIPTION: Draws a red rectangle at (241, 45) with width 100 and height 72.
; PLAN: r0=241(x), r1=45(y), r2=100(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 45
LDI r2, 100
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
