; DESCRIPTION: Draws a red rectangle at (47, 5) with width 16 and height 68.
; PLAN: r0=47(x), r1=5(y), r2=16(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 5
LDI r2, 16
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
