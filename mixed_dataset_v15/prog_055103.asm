; DESCRIPTION: Draws a orange rectangle at (401, 160) with width 102 and height 13.
; PLAN: r0=401(x), r1=160(y), r2=102(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 160
LDI r2, 102
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
