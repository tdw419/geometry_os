; DESCRIPTION: Composite: Places a orange dot at position (42, 10) then Places a yellow line segment connecting (342, 228) to (463, 130).
; PLAN: r0=42(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=342(x1), r6=228(y1), r7=463(x2), r8=130(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 342
LDI r6, 228
LDI r7, 463
LDI r8, 130
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
