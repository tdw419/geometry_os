; DESCRIPTION: Composite: Places a magenta dot at position (286, 185) then Creates a blue rectangular region at (159, 161) spanning 96 by 23 pixels.
; PLAN: r0=286(x), r1=185(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=161(y), r7=96(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 185
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 161
LDI r7, 96
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
