; DESCRIPTION: Composite: Sets a single black pixel at (439, 254) then Renders a green box of size 44x100 starting at (360, 101).
; PLAN: r0=439(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=101(y), r7=44(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 360
LDI r6, 101
LDI r7, 44
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
