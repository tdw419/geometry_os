; DESCRIPTION: Draws a red rectangle at (187, 229) with width 25 and height 26.
; PLAN: r0=187(x), r1=229(y), r2=25(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 229
LDI r2, 25
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
