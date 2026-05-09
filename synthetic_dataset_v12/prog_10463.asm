; DESCRIPTION: Composite: Places a cyan dot at position (111, 148) then Creates a orange rectangular region at (99, 147) spanning 10 by 97 pixels.
; PLAN: r0=111(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=147(y), r7=10(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 147
LDI r7, 10
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
