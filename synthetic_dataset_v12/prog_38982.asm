; DESCRIPTION: Draws a red rectangle at (264, 0) with width 104 and height 56.
; PLAN: r0=264(x), r1=0(y), r2=104(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 0
LDI r2, 104
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
