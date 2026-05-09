; DESCRIPTION: Composite: . Then Places a black dot at position (194, 206). Then Draws a orange rectangle at (176, 82) with width 50 and height 50.
; PLAN: r0=194(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=176(x), r1=82(y), r2=50(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (194, 206).
; PLAN: r0=194(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (176, 82) with width 50 and height 50.
; PLAN: r0=176(x), r1=82(y), r2=50(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 82
LDI r2, 50
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
