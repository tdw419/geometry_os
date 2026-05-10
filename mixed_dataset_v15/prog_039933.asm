; DESCRIPTION: Draws a orange rectangle at (367, 146) with width 102 and height 71.
; PLAN: r0=367(x), r1=146(y), r2=102(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 146
LDI r2, 102
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
