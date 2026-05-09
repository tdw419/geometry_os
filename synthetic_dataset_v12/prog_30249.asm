; DESCRIPTION: Composite: Places a white line segment connecting (503, 187) to (498, 130) then Sets a single cyan pixel at (413, 41).
; PLAN: r0=503(x1), r1=187(y1), r2=498(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 503
LDI r1, 187
LDI r2, 498
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
