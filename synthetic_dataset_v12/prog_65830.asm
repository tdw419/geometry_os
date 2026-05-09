; DESCRIPTION: Composite: Places a white dot at position (208, 125) then Places a green line segment connecting (298, 23) to (2, 59).
; PLAN: r0=208(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=23(y1), r7=2(x2), r8=59(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 23
LDI r7, 2
LDI r8, 59
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
