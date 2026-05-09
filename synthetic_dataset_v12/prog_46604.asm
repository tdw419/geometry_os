; DESCRIPTION: Composite: Sets a single purple pixel at (269, 200) then Renders a black line between points (447, 221) and (320, 114).
; PLAN: r0=269(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=221(y1), r7=320(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 221
LDI r7, 320
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
