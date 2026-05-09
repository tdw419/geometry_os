; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (25, 106) with width 105 and height 110. Then Places a red dot at position (71, 228).
; PLAN: r0=25(x), r1=106(y), r2=105(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=71(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (25, 106) with width 105 and height 110.
; PLAN: r0=25(x), r1=106(y), r2=105(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 106
LDI r2, 105
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (71, 228).
; PLAN: r0=71(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 228
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
