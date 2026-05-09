; DESCRIPTION: Composite: . Then Places a white dot at position (182, 145). Then Draws a orange rectangle at (87, 108) with width 119 and height 116.
; PLAN: r0=182(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=108(y), r2=119(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (182, 145).
; PLAN: r0=182(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (87, 108) with width 119 and height 116.
; PLAN: r0=87(x), r1=108(y), r2=119(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 108
LDI r2, 119
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
