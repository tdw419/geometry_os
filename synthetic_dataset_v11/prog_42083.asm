; DESCRIPTION: Composite: . Then Draws a black rectangle at (31, 30) with width 29 and height 30. Then Places a black dot at position (61, 86).
; PLAN: r0=31(x), r1=30(y), r2=29(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=61(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (31, 30) with width 29 and height 30.
; PLAN: r0=31(x), r1=30(y), r2=29(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 30
LDI r2, 29
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (61, 86).
; PLAN: r0=61(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 86
LDI r2, 0x000000
PSET r0, r1, r2
HALT
