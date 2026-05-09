; DESCRIPTION: Draws a red rectangle at (365, 91) with width 58 and height 86.
; PLAN: r0=365(x), r1=91(y), r2=58(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 91
LDI r2, 58
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
