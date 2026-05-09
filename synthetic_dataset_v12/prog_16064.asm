; DESCRIPTION: Draws a red rectangle at (276, 59) with width 117 and height 91.
; PLAN: r0=276(x), r1=59(y), r2=117(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 59
LDI r2, 117
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
