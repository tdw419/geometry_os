; DESCRIPTION: Composite: Sets a single yellow pixel at (387, 68) then Places a green line segment connecting (410, 53) to (186, 61).
; PLAN: r0=387(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=53(y1), r7=186(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 68
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 53
LDI r7, 186
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
