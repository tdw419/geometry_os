; DESCRIPTION: Composite: Places a magenta dot at position (383, 101) then Creates a purple rectangular region at (242, 45) spanning 69 by 48 pixels.
; PLAN: r0=383(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=45(y), r7=69(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 45
LDI r7, 69
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
