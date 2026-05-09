; DESCRIPTION: Composite: . Then Draws a red rectangle at (40, 73) with width 89 and height 77. Then Places a yellow dot at position (234, 121).
; PLAN: r0=40(x), r1=73(y), r2=89(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (40, 73) with width 89 and height 77.
; PLAN: r0=40(x), r1=73(y), r2=89(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 73
LDI r2, 89
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (234, 121).
; PLAN: r0=234(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
