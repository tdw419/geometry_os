; DESCRIPTION: Composite: Sets a single white pixel at (293, 226) then Creates a magenta rectangular region at (65, 139) spanning 103 by 71 pixels.
; PLAN: r0=293(x), r1=226(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=139(y), r7=103(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 226
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 139
LDI r7, 103
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
