; DESCRIPTION: Composite: Places a white dot at position (158, 30) then Creates a blue rectangular region at (171, 16) spanning 105 by 120 pixels.
; PLAN: r0=158(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=16(y), r7=105(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 16
LDI r7, 105
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
