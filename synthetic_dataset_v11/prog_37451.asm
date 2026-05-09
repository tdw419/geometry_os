; DESCRIPTION: Draws a red rectangle at (106, 39) with width 104 and height 98.
; PLAN: r0=106(x), r1=39(y), r2=104(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 39
LDI r2, 104
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
