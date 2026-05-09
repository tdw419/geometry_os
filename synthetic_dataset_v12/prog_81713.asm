; DESCRIPTION: Composite: Sets a single red pixel at (25, 52) then Renders a blue box of size 38x79 starting at (225, 109).
; PLAN: r0=25(x), r1=52(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=109(y), r7=38(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 52
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 225
LDI r6, 109
LDI r7, 38
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
