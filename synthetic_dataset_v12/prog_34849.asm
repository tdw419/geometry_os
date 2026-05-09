; DESCRIPTION: Composite: Renders a red box of size 28x119 starting at (359, 50) then Sets a single orange pixel at (346, 97).
; PLAN: r0=359(x), r1=50(y), r2=28(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=97(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 50
LDI r2, 28
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 97
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
