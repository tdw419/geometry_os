; DESCRIPTION: Draws a red rectangle at (260, 86) with width 55 and height 71.
; PLAN: r0=260(x), r1=86(y), r2=55(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 86
LDI r2, 55
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
