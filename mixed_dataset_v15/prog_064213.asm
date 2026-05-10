; DESCRIPTION: Composite: Sets a single white pixel at (128, 228) then Creates a magenta rectangular region at (435, 19) spanning 52 by 56 pixels.
; PLAN: r0=128(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=19(y), r7=52(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 19
LDI r7, 52
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
