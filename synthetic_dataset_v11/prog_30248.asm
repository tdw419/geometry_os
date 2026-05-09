; DESCRIPTION: Composite: . Then Sets a single black pixel at (135, 216). Then Renders a orange box of size 35x27 starting at (56, 203).
; PLAN: r0=135(x), r1=216(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=56(x), r1=203(y), r2=35(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (135, 216).
; PLAN: r0=135(x), r1=216(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 216
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 35x27 starting at (56, 203).
; PLAN: r0=56(x), r1=203(y), r2=35(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 203
LDI r2, 35
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
