; DESCRIPTION: Composite: Sets a single green pixel at (401, 219) then Renders a yellow line between points (158, 185) and (383, 128).
; PLAN: r0=401(x), r1=219(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=185(y1), r7=383(x2), r8=128(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 219
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 185
LDI r7, 383
LDI r8, 128
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
