; DESCRIPTION: Composite: Places a white dot at position (89, 174) then Renders a yellow box of size 76x46 starting at (181, 185).
; PLAN: r0=89(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=185(y), r7=76(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 185
LDI r7, 76
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
