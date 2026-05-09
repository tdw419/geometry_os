; DESCRIPTION: Composite: Places a white dot at position (189, 243) then Places a red line segment connecting (421, 253) to (245, 77).
; PLAN: r0=189(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=421(x1), r6=253(y1), r7=245(x2), r8=77(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 421
LDI r6, 253
LDI r7, 245
LDI r8, 77
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
