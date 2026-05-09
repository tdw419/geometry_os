; DESCRIPTION: Draws a red rectangle at (171, 145) with width 15 and height 32.
; PLAN: r0=171(x), r1=145(y), r2=15(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 145
LDI r2, 15
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
