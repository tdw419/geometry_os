; DESCRIPTION: Composite: Places a yellow dot at position (104, 108) then Creates a white rectangular region at (355, 135) spanning 84 by 108 pixels.
; PLAN: r0=104(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=135(y), r7=84(width), r8=108(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 355
LDI r6, 135
LDI r7, 84
LDI r8, 108
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
