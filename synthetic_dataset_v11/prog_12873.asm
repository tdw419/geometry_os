; DESCRIPTION: Draws a red rectangle at (94, 3) with width 103 and height 59.
; PLAN: r0=94(x), r1=3(y), r2=103(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 3
LDI r2, 103
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
