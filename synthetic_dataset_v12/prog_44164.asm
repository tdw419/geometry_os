; DESCRIPTION: Composite: Places a green dot at position (265, 182) then Renders a red line between points (380, 88) and (317, 12).
; PLAN: r0=265(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x1), r6=88(y1), r7=317(x2), r8=12(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 88
LDI r7, 317
LDI r8, 12
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
