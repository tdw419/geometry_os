; DESCRIPTION: Composite: Places a cyan dot at position (82, 35) then Creates a blue rectangular region at (227, 137) spanning 28 by 69 pixels.
; PLAN: r0=82(x), r1=35(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=137(y), r7=28(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 35
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 137
LDI r7, 28
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
