; DESCRIPTION: Composite: Sets a single orange pixel at (269, 249) then Creates a black rectangular region at (328, 33) spanning 104 by 96 pixels.
; PLAN: r0=269(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=33(y), r7=104(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 249
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 328
LDI r6, 33
LDI r7, 104
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
