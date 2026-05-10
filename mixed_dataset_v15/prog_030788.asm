; DESCRIPTION: Composite: Places a magenta dot at position (136, 131) then Places a cyan line segment connecting (439, 33) to (248, 61).
; PLAN: r0=136(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=33(y1), r7=248(x2), r8=61(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 33
LDI r7, 248
LDI r8, 61
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
