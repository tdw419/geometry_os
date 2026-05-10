; DESCRIPTION: Draws a red rectangle at (290, 13) with width 28 and height 51.
; PLAN: r0=290(x), r1=13(y), r2=28(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 13
LDI r2, 28
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
