; DESCRIPTION: Composite: Sets a single cyan pixel at (302, 108) then Draws a cyan line from (327, 54) to (347, 187).
; PLAN: r0=302(x), r1=108(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=54(y1), r7=347(x2), r8=187(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 108
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 54
LDI r7, 347
LDI r8, 187
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
