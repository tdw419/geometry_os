; DESCRIPTION: Composite: . Then Draws a orange rectangle at (158, 140) with width 73 and height 21. Then Sets a single red pixel at (243, 215).
; PLAN: r0=158(x), r1=140(y), r2=73(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=243(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (158, 140) with width 73 and height 21.
; PLAN: r0=158(x), r1=140(y), r2=73(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 140
LDI r2, 73
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (243, 215).
; PLAN: r0=243(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
