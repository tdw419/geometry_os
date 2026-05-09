; DESCRIPTION: Composite: Places a magenta dot at position (80, 75) then Places a cyan line segment connecting (10, 106) to (396, 87).
; PLAN: r0=80(x), r1=75(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=10(x1), r6=106(y1), r7=396(x2), r8=87(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 75
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 106
LDI r7, 396
LDI r8, 87
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
