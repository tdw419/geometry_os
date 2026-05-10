; DESCRIPTION: Composite: Sets a single magenta pixel at (482, 197) then Creates a orange rectangular region at (68, 43) spanning 35 by 96 pixels.
; PLAN: r0=482(x), r1=197(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=43(y), r7=35(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 197
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 43
LDI r7, 35
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
