; DESCRIPTION: Draws a red rectangle at (218, 0) with width 31 and height 69.
; PLAN: r0=218(x), r1=0(y), r2=31(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 0
LDI r2, 31
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
