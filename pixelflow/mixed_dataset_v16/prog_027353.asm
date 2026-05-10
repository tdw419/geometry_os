; DESCRIPTION: Draws a red rectangle at (108, 171) with width 63 and height 11.
; PLAN: r0=108(x), r1=171(y), r2=63(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 171
LDI r2, 63
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
