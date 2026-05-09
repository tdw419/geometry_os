; DESCRIPTION: Composite: . Then Draws a orange rectangle at (77, 192) with width 36 and height 51. Then Places a white dot at position (133, 99).
; PLAN: r0=77(x), r1=192(y), r2=36(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=133(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (77, 192) with width 36 and height 51.
; PLAN: r0=77(x), r1=192(y), r2=36(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 192
LDI r2, 36
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (133, 99).
; PLAN: r0=133(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
