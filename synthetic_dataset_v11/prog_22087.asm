; DESCRIPTION: Composite: . Then Draws a black rectangle at (135, 32) with width 105 and height 93. Then Places a black dot at position (74, 110).
; PLAN: r0=135(x), r1=32(y), r2=105(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (135, 32) with width 105 and height 93.
; PLAN: r0=135(x), r1=32(y), r2=105(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 32
LDI r2, 105
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (74, 110).
; PLAN: r0=74(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 110
LDI r2, 0x000000
PSET r0, r1, r2
HALT
