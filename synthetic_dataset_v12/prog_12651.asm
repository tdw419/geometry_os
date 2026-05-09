; DESCRIPTION: Composite: Renders a red line between points (218, 117) and (58, 196) then Places a cyan dot at position (497, 2).
; PLAN: r0=218(x1), r1=117(y1), r2=58(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 117
LDI r2, 58
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
