; DESCRIPTION: Composite: . Then Places a white dot at position (143, 118). Then Draws a black rectangle at (207, 21) with width 32 and height 85.
; PLAN: r0=143(x), r1=118(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=207(x), r1=21(y), r2=32(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (143, 118).
; PLAN: r0=143(x), r1=118(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 118
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (207, 21) with width 32 and height 85.
; PLAN: r0=207(x), r1=21(y), r2=32(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 21
LDI r2, 32
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
