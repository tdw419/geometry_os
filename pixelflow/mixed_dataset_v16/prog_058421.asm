; DESCRIPTION: Composite: Sets a single cyan pixel at (120, 49) then Places a blue 77x100 rectangle at position (186, 129).
; PLAN: r0=120(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=129(y), r7=77(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 129
LDI r7, 77
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
