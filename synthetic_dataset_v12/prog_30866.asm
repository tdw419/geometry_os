; DESCRIPTION: Composite: Sets a single green pixel at (390, 38) then Renders a green box of size 61x68 starting at (158, 64).
; PLAN: r0=390(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=64(y), r7=61(width), r8=68(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 64
LDI r7, 61
LDI r8, 68
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
