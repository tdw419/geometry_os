; DESCRIPTION: Composite: Places a red dot at position (65, 6) then Creates a purple rectangular region at (5, 10) spanning 83 by 69 pixels.
; PLAN: r0=65(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=5(x), r6=10(y), r7=83(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 5
LDI r6, 10
LDI r7, 83
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
