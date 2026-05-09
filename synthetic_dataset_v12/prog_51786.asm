; DESCRIPTION: Composite: Places a cyan dot at position (297, 78) then Places a black line segment connecting (168, 95) to (189, 184).
; PLAN: r0=297(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=168(x1), r6=95(y1), r7=189(x2), r8=184(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 95
LDI r7, 189
LDI r8, 184
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
