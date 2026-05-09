; DESCRIPTION: Composite: Places a green dot at position (25, 9) then Creates a yellow rectangular region at (14, 212) spanning 17 by 16 pixels.
; PLAN: r0=25(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=14(x), r6=212(y), r7=17(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 9
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 14
LDI r6, 212
LDI r7, 17
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
