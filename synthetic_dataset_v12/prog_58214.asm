; DESCRIPTION: Composite: Renders a orange box of size 89x99 starting at (354, 61) then Sets a single red pixel at (442, 251).
; PLAN: r0=354(x), r1=61(y), r2=89(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=251(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 61
LDI r2, 89
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 251
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
