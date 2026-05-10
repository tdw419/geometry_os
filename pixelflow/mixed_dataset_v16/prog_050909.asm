; DESCRIPTION: Draws a red rectangle at (268, 40) with width 77 and height 91.
; PLAN: r0=268(x), r1=40(y), r2=77(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 40
LDI r2, 77
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
