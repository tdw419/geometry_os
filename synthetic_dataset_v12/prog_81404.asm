; DESCRIPTION: Composite: Sets a single cyan pixel at (12, 67) then Places a red line segment connecting (184, 95) to (144, 168).
; PLAN: r0=12(x), r1=67(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=95(y1), r7=144(x2), r8=168(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 67
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 95
LDI r7, 144
LDI r8, 168
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
