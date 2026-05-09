; DESCRIPTION: Composite: Sets a single yellow pixel at (347, 113) then Renders a black line between points (239, 215) and (434, 34).
; PLAN: r0=347(x), r1=113(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=239(x1), r6=215(y1), r7=434(x2), r8=34(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 113
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 239
LDI r6, 215
LDI r7, 434
LDI r8, 34
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
