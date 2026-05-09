; DESCRIPTION: Draws a red rectangle at (236, 68) with width 104 and height 45.
; PLAN: r0=236(x), r1=68(y), r2=104(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 68
LDI r2, 104
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
