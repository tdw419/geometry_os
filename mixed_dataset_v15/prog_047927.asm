; DESCRIPTION: Draws a red rectangle at (299, 94) with width 104 and height 60.
; PLAN: r0=299(x), r1=94(y), r2=104(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 94
LDI r2, 104
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
