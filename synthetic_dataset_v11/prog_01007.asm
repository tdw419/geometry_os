; DESCRIPTION: Draws a red rectangle at (2, 180) with width 40 and height 71.
; PLAN: r0=2(x), r1=180(y), r2=40(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 180
LDI r2, 40
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
