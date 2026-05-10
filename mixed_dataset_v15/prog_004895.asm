; DESCRIPTION: Composite: Sets a single magenta pixel at (373, 150) then Creates a blue rectangular region at (382, 180) spanning 116 by 60 pixels.
; PLAN: r0=373(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=180(y), r7=116(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 180
LDI r7, 116
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
