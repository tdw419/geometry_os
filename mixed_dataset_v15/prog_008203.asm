; DESCRIPTION: Composite: Sets a single white pixel at (96, 250) then Creates a blue rectangular region at (431, 41) spanning 36 by 115 pixels.
; PLAN: r0=96(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=41(y), r7=36(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 41
LDI r7, 36
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
