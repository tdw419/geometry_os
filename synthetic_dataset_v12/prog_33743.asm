; DESCRIPTION: Draws a red rectangle at (437, 100) with width 55 and height 50.
; PLAN: r0=437(x), r1=100(y), r2=55(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 100
LDI r2, 55
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
