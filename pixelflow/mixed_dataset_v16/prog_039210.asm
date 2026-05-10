; DESCRIPTION: Composite: Renders a red box of size 81x87 starting at (384, 89) then Sets a single red pixel at (9, 242).
; PLAN: r0=384(x), r1=89(y), r2=81(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x), r6=242(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 89
LDI r2, 81
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 242
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
