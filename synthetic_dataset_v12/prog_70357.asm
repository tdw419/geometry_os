; DESCRIPTION: Composite: Sets a single cyan pixel at (494, 7) then Draws a white line from (444, 175) to (481, 112).
; PLAN: r0=494(x), r1=7(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=175(y1), r7=481(x2), r8=112(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 7
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 444
LDI r6, 175
LDI r7, 481
LDI r8, 112
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
