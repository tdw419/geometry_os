; DESCRIPTION: Draws a orange rectangle at (164, 39) with width 77 and height 54.
; PLAN: r0=164(x), r1=39(y), r2=77(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 39
LDI r2, 77
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
