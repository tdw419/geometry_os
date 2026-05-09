; DESCRIPTION: Composite: Renders a red box of size 89x77 starting at (77, 73) then Sets a single green pixel at (400, 235) then Places a red circle of radius 34 at center (468, 180).
; PLAN: r0=77(x), r1=73(y), r2=89(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=468(x), r11=180(y), r12=34(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 73
LDI r2, 89
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 468
LDI r11, 180
LDI r12, 34
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
