; DESCRIPTION: Composite: Places a white dot at position (142, 126) then Places a black line segment connecting (47, 69) to (463, 98).
; PLAN: r0=142(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=47(x1), r6=69(y1), r7=463(x2), r8=98(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 47
LDI r6, 69
LDI r7, 463
LDI r8, 98
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
