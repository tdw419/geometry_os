; DESCRIPTION: Draws a red rectangle at (106, 50) with width 10 and height 28.
; PLAN: r0=106(x), r1=50(y), r2=10(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 50
LDI r2, 10
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
