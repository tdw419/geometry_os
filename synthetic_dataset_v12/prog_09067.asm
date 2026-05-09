; DESCRIPTION: Draws a red rectangle at (463, 187) with width 45 and height 46.
; PLAN: r0=463(x), r1=187(y), r2=45(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 187
LDI r2, 45
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
