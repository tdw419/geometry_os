; DESCRIPTION: Composite: Sets a single white pixel at (217, 193) then Renders a purple box of size 34x32 starting at (75, 143).
; PLAN: r0=217(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=143(y), r7=34(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 143
LDI r7, 34
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
