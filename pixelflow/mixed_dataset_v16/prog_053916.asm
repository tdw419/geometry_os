; DESCRIPTION: Composite: Places a magenta dot at position (116, 6) then Draws a cyan line from (274, 110) to (226, 49).
; PLAN: r0=116(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=274(x1), r6=110(y1), r7=226(x2), r8=49(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 110
LDI r7, 226
LDI r8, 49
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
