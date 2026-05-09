; DESCRIPTION: Composite: Sets a single cyan pixel at (327, 188) then Places a black line segment connecting (68, 197) to (244, 12).
; PLAN: r0=327(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=68(x1), r6=197(y1), r7=244(x2), r8=12(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 197
LDI r7, 244
LDI r8, 12
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
