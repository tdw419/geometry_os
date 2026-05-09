; DESCRIPTION: Composite: Places a black dot at position (271, 203) then Places a white line segment connecting (29, 160) to (141, 137).
; PLAN: r0=271(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=29(x1), r6=160(y1), r7=141(x2), r8=137(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 29
LDI r6, 160
LDI r7, 141
LDI r8, 137
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
