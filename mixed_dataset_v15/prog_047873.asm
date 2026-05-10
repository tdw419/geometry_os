; DESCRIPTION: Composite: Sets a single orange pixel at (446, 153) then Creates a black rectangular region at (210, 71) spanning 20 by 55 pixels.
; PLAN: r0=446(x), r1=153(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=71(y), r7=20(width), r8=55(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 153
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 210
LDI r6, 71
LDI r7, 20
LDI r8, 55
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
