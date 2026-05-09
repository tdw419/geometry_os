; DESCRIPTION: Composite: . Then Draws a white rectangle at (9, 150) with width 106 and height 77. Then Sets a single red pixel at (50, 231).
; PLAN: r0=9(x), r1=150(y), r2=106(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=50(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (9, 150) with width 106 and height 77.
; PLAN: r0=9(x), r1=150(y), r2=106(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 150
LDI r2, 106
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (50, 231).
; PLAN: r0=50(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
