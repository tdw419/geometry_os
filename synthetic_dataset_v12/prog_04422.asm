; DESCRIPTION: Composite: Places a blue dot at position (413, 1) then Creates a magenta rectangular region at (30, 148) spanning 112 by 54 pixels.
; PLAN: r0=413(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=148(y), r7=112(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 148
LDI r7, 112
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
