; DESCRIPTION: Draws a orange rectangle at (46, 213) with width 18 and height 31.
; PLAN: r0=46(x), r1=213(y), r2=18(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 213
LDI r2, 18
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
