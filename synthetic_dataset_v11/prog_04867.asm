; DESCRIPTION: Draws a red rectangle at (123, 57) with width 60 and height 102.
; PLAN: r0=123(x), r1=57(y), r2=60(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 57
LDI r2, 60
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
