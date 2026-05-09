; DESCRIPTION: Composite: Sets a single green pixel at (386, 81) then Renders a green box of size 45x85 starting at (269, 79).
; PLAN: r0=386(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=79(y), r7=45(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 269
LDI r6, 79
LDI r7, 45
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
