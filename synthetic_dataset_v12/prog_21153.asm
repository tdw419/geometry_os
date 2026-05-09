; DESCRIPTION: Composite: Places a blue dot at position (411, 217) then Creates a purple rectangular region at (8, 47) spanning 80 by 11 pixels.
; PLAN: r0=411(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=47(y), r7=80(width), r8=11(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 47
LDI r7, 80
LDI r8, 11
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
