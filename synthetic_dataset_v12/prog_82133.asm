; DESCRIPTION: Composite: Sets a single magenta pixel at (58, 93) then Creates a blue rectangular region at (100, 46) spanning 66 by 19 pixels.
; PLAN: r0=58(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=46(y), r7=66(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 46
LDI r7, 66
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
