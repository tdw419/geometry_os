; DESCRIPTION: Composite: Places a white dot at position (69, 184) then Renders a green box of size 78x114 starting at (165, 100).
; PLAN: r0=69(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=100(y), r7=78(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 100
LDI r7, 78
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
