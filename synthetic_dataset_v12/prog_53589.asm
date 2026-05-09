; DESCRIPTION: Composite: Creates a magenta circular shape at (466, 166) with radius 25 then Sets a single orange pixel at (74, 42).
; PLAN: r0=466(x), r1=166(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=42(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 166
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 42
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
