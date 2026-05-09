; DESCRIPTION: Draws a red rectangle at (321, 121) with width 117 and height 19.
; PLAN: r0=321(x), r1=121(y), r2=117(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 121
LDI r2, 117
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
