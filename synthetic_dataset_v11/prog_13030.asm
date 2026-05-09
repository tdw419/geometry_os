; DESCRIPTION: Composite: . Then Places a cyan dot at position (3, 84). Then Draws a orange rectangle at (214, 159) with width 36 and height 84.
; PLAN: r0=3(x), r1=84(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=214(x), r1=159(y), r2=36(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (3, 84).
; PLAN: r0=3(x), r1=84(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 84
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (214, 159) with width 36 and height 84.
; PLAN: r0=214(x), r1=159(y), r2=36(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 159
LDI r2, 36
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
