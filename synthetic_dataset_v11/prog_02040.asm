; DESCRIPTION: Composite: . Then Places a orange dot at position (51, 161). Then Draws a black rectangle at (3, 173) with width 13 and height 32.
; PLAN: r0=51(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=3(x), r1=173(y), r2=13(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (51, 161).
; PLAN: r0=51(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 161
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (3, 173) with width 13 and height 32.
; PLAN: r0=3(x), r1=173(y), r2=13(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 173
LDI r2, 13
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
