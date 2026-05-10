; DESCRIPTION: Composite: Places a magenta dot at position (30, 159) then Renders a orange line between points (18, 22) and (73, 224).
; PLAN: r0=30(x), r1=159(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=22(y1), r7=73(x2), r8=224(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 159
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 22
LDI r7, 73
LDI r8, 224
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
