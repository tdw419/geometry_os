; DESCRIPTION: Composite: . Then Renders a orange box of size 19x49 starting at (149, 73). Then Sets a single red pixel at (175, 185).
; PLAN: r0=149(x), r1=73(y), r2=19(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange box of size 19x49 starting at (149, 73).
; PLAN: r0=149(x), r1=73(y), r2=19(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 73
LDI r2, 19
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (175, 185).
; PLAN: r0=175(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
