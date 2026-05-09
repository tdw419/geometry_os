; DESCRIPTION: Composite: . Then Places a orange dot at position (131, 19). Then Draws a cyan rectangle at (215, 28) with width 15 and height 45.
; PLAN: r0=131(x), r1=19(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=215(x), r1=28(y), r2=15(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (131, 19).
; PLAN: r0=131(x), r1=19(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 19
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (215, 28) with width 15 and height 45.
; PLAN: r0=215(x), r1=28(y), r2=15(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 28
LDI r2, 15
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
