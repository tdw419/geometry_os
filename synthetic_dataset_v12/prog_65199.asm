; DESCRIPTION: Draws a red rectangle at (428, 54) with width 21 and height 79.
; PLAN: r0=428(x), r1=54(y), r2=21(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 54
LDI r2, 21
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
