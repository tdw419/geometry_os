; DESCRIPTION: Composite: Places a red dot at position (413, 221) then Renders a red line between points (386, 49) and (238, 128) then Places a white circle of radius 16 at center (335, 36).
; PLAN: r0=413(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=386(x1), r6=49(y1), r7=238(x2), r8=128(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=36(y), r12=16(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 221
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 386
LDI r6, 49
LDI r7, 238
LDI r8, 128
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 36
LDI r12, 16
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
