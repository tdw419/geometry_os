; DESCRIPTION: Draws a red rectangle at (152, 190) with width 22 and height 22.
; PLAN: r0=152(x), r1=190(y), r2=22(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 190
LDI r2, 22
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
