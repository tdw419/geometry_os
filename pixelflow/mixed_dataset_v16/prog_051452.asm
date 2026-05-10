; DESCRIPTION: Composite: Sets a single orange pixel at (292, 224) then Creates a yellow rectangular region at (112, 120) spanning 53 by 39 pixels.
; PLAN: r0=292(x), r1=224(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=120(y), r7=53(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 224
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 112
LDI r6, 120
LDI r7, 53
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
