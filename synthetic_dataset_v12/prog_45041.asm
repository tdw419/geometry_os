; DESCRIPTION: Composite: Places a green dot at position (431, 2) then Places a white line segment connecting (411, 240) to (262, 34).
; PLAN: r0=431(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=240(y1), r7=262(x2), r8=34(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 2
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 411
LDI r6, 240
LDI r7, 262
LDI r8, 34
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
