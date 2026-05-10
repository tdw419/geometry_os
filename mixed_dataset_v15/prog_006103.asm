; DESCRIPTION: Composite: Renders a white box of size 34x23 starting at (73, 36) then Sets a single orange pixel at (384, 174).
; PLAN: r0=73(x), r1=36(y), r2=34(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=174(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 36
LDI r2, 34
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 174
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
