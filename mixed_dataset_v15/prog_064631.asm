; DESCRIPTION: Composite: Places a magenta dot at position (154, 7) then Places a cyan line segment connecting (335, 126) to (341, 148).
; PLAN: r0=154(x), r1=7(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=335(x1), r6=126(y1), r7=341(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 7
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 126
LDI r7, 341
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
