; DESCRIPTION: Composite: Places a green dot at position (208, 175) then Renders a cyan line between points (354, 160) and (104, 123).
; PLAN: r0=208(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=160(y1), r7=104(x2), r8=123(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 354
LDI r6, 160
LDI r7, 104
LDI r8, 123
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
