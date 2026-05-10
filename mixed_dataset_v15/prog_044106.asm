; DESCRIPTION: Draws a orange rectangle at (418, 2) with width 33 and height 79.
; PLAN: r0=418(x), r1=2(y), r2=33(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 2
LDI r2, 33
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
