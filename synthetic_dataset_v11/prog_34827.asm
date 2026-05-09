; DESCRIPTION: Composite: . Then Draws a orange rectangle at (100, 101) with width 73 and height 13. Then Places a cyan dot at position (27, 151).
; PLAN: r0=100(x), r1=101(y), r2=73(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=27(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (100, 101) with width 73 and height 13.
; PLAN: r0=100(x), r1=101(y), r2=73(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 101
LDI r2, 73
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (27, 151).
; PLAN: r0=27(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 151
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
