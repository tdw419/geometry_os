; DESCRIPTION: Draws a orange rectangle at (57, 154) with width 77 and height 34.
; PLAN: r0=57(x), r1=154(y), r2=77(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 154
LDI r2, 77
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
