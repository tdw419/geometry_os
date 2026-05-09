; DESCRIPTION: Composite: Sets a single yellow pixel at (479, 103) then Places a blue line segment connecting (153, 133) to (467, 109).
; PLAN: r0=479(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=153(x1), r6=133(y1), r7=467(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 153
LDI r6, 133
LDI r7, 467
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
