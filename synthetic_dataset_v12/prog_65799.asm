; DESCRIPTION: Composite: Places a red dot at position (315, 205) then Places a green line segment connecting (440, 77) to (365, 49).
; PLAN: r0=315(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=77(y1), r7=365(x2), r8=49(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 440
LDI r6, 77
LDI r7, 365
LDI r8, 49
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
