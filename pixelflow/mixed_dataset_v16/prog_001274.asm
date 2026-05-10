; DESCRIPTION: Composite: Places a green dot at position (181, 98) then Places a red line segment connecting (289, 35) to (33, 222).
; PLAN: r0=181(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=35(y1), r7=33(x2), r8=222(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 289
LDI r6, 35
LDI r7, 33
LDI r8, 222
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
