; DESCRIPTION: Draws a red rectangle at (130, 7) with width 117 and height 70.
; PLAN: r0=130(x), r1=7(y), r2=117(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 7
LDI r2, 117
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
