; DESCRIPTION: Composite: . Then Draws a white rectangle at (95, 127) with width 104 and height 73. Then Places a black dot at position (119, 79).
; PLAN: r0=95(x), r1=127(y), r2=104(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=119(x), r1=79(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (95, 127) with width 104 and height 73.
; PLAN: r0=95(x), r1=127(y), r2=104(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 127
LDI r2, 104
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (119, 79).
; PLAN: r0=119(x), r1=79(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 79
LDI r2, 0x000000
PSET r0, r1, r2
HALT
