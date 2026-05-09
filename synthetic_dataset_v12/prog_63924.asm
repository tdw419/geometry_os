; DESCRIPTION: Draws a red rectangle at (161, 150) with width 104 and height 94.
; PLAN: r0=161(x), r1=150(y), r2=104(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 150
LDI r2, 104
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
