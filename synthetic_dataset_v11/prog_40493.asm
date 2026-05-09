; DESCRIPTION: Composite: . Then Draws a black rectangle at (116, 40) with width 89 and height 10. Then Places a red dot at position (50, 94).
; PLAN: r0=116(x), r1=40(y), r2=89(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=50(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (116, 40) with width 89 and height 10.
; PLAN: r0=116(x), r1=40(y), r2=89(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 40
LDI r2, 89
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (50, 94).
; PLAN: r0=50(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
