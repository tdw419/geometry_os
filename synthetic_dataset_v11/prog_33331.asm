; DESCRIPTION: Draws a red rectangle at (1, 154) with width 26 and height 86.
; PLAN: r0=1(x), r1=154(y), r2=26(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 154
LDI r2, 26
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
