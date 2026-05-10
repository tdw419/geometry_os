; DESCRIPTION: Composite: Places a green line segment connecting (22, 73) to (76, 174) then Places a cyan dot at position (74, 111).
; PLAN: r0=22(x1), r1=73(y1), r2=76(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 73
LDI r2, 76
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
