; DESCRIPTION: Draws a red rectangle at (210, 20) with width 68 and height 112.
; PLAN: r0=210(x), r1=20(y), r2=68(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 20
LDI r2, 68
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
