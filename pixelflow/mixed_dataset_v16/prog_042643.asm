; DESCRIPTION: Composite: Places a purple dot at position (75, 77) then Creates a purple rectangular region at (16, 47) spanning 21 by 84 pixels.
; PLAN: r0=75(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=16(x), r6=47(y), r7=21(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 16
LDI r6, 47
LDI r7, 21
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
