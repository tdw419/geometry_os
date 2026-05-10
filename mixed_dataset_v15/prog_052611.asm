; DESCRIPTION: Composite: Sets a single cyan pixel at (456, 33) then Places a black line segment connecting (109, 168) to (311, 198).
; PLAN: r0=456(x), r1=33(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=168(y1), r7=311(x2), r8=198(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 33
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 168
LDI r7, 311
LDI r8, 198
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
