; DESCRIPTION: Composite: Renders a cyan line between points (250, 218) and (94, 228) then Sets a single black pixel at (328, 229).
; PLAN: r0=250(x1), r1=218(y1), r2=94(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=229(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 218
LDI r2, 94
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 229
LDI r7, 0x000000
PSET r5, r6, r7
HALT
