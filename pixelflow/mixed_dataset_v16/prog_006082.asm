; DESCRIPTION: Composite: Sets a single blue pixel at (396, 164) then Creates a magenta rectangular region at (146, 52) spanning 99 by 80 pixels.
; PLAN: r0=396(x), r1=164(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=52(y), r7=99(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 164
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 52
LDI r7, 99
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
