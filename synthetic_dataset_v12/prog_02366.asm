; DESCRIPTION: Composite: Places a cyan dot at position (250, 23) then Creates a purple rectangular region at (482, 132) spanning 29 by 19 pixels.
; PLAN: r0=250(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=482(x), r6=132(y), r7=29(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 482
LDI r6, 132
LDI r7, 29
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
