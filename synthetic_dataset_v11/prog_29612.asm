; DESCRIPTION: Draws a red rectangle at (27, 91) with width 61 and height 59.
; PLAN: r0=27(x), r1=91(y), r2=61(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 91
LDI r2, 61
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
