; DESCRIPTION: Draws a orange rectangle at (274, 34) with width 45 and height 93.
; PLAN: r0=274(x), r1=34(y), r2=45(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 34
LDI r2, 45
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
