; DESCRIPTION: Composite: Sets a single green pixel at (252, 141) then Renders a cyan line between points (60, 49) and (50, 219).
; PLAN: r0=252(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=60(x1), r6=49(y1), r7=50(x2), r8=219(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 60
LDI r6, 49
LDI r7, 50
LDI r8, 219
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
