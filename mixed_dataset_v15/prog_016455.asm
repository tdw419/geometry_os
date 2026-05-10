; DESCRIPTION: Draws a orange rectangle at (321, 47) with width 90 and height 76.
; PLAN: r0=321(x), r1=47(y), r2=90(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 47
LDI r2, 90
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
