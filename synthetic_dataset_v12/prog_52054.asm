; DESCRIPTION: Draws a red rectangle at (66, 229) with width 109 and height 13.
; PLAN: r0=66(x), r1=229(y), r2=109(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 229
LDI r2, 109
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
