; DESCRIPTION: Composite: . Then Places a red dot at position (158, 192). Then Draws a cyan rectangle at (62, 118) with width 19 and height 77.
; PLAN: r0=158(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=118(y), r2=19(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (158, 192).
; PLAN: r0=158(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (62, 118) with width 19 and height 77.
; PLAN: r0=62(x), r1=118(y), r2=19(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 118
LDI r2, 19
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
