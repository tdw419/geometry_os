; DESCRIPTION: Composite: Sets a single orange pixel at (181, 147) then Creates a black rectangular region at (92, 71) spanning 16 by 88 pixels.
; PLAN: r0=181(x), r1=147(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=71(y), r7=16(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 147
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 92
LDI r6, 71
LDI r7, 16
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
