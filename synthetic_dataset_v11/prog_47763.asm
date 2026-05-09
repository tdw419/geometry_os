; DESCRIPTION: Composite: . Then Sets a single orange pixel at (208, 240). Then Renders a orange box of size 84x13 starting at (17, 228).
; PLAN: r0=208(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=17(x), r1=228(y), r2=84(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (208, 240).
; PLAN: r0=208(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 84x13 starting at (17, 228).
; PLAN: r0=17(x), r1=228(y), r2=84(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 228
LDI r2, 84
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
