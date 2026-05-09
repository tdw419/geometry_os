; DESCRIPTION: Composite: Sets a single green pixel at (256, 239) then Draws a purple line from (299, 38) to (432, 167).
; PLAN: r0=256(x), r1=239(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=38(y1), r7=432(x2), r8=167(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 239
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 299
LDI r6, 38
LDI r7, 432
LDI r8, 167
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
