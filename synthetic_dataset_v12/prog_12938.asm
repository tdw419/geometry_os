; DESCRIPTION: Composite: Creates a orange circular shape at (380, 166) with radius 73 then Sets a single red pixel at (501, 243).
; PLAN: r0=380(x), r1=166(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=243(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 166
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 243
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
