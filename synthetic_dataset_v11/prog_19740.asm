; DESCRIPTION: Draws a orange rectangle at (202, 166) with width 46 and height 31.
; PLAN: r0=202(x), r1=166(y), r2=46(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 166
LDI r2, 46
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
