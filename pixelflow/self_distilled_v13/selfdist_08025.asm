; DESCRIPTION: Draws a red rectangle at (368, 75) with width 73 and height 27.
; PLAN: r0=368(x), r1=75(y), r2=73(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 75
LDI r2, 73
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
