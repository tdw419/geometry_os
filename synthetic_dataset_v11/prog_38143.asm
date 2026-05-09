; DESCRIPTION: Composite: . Then Draws a white rectangle at (201, 190) with width 25 and height 66. Then Places a red dot at position (75, 21).
; PLAN: r0=201(x), r1=190(y), r2=25(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (201, 190) with width 25 and height 66.
; PLAN: r0=201(x), r1=190(y), r2=25(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 190
LDI r2, 25
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (75, 21).
; PLAN: r0=75(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
