; DESCRIPTION: Composite: Places a green dot at position (456, 6) then Renders a red line between points (7, 173) and (245, 186).
; PLAN: r0=456(x), r1=6(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=173(y1), r7=245(x2), r8=186(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 6
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 7
LDI r6, 173
LDI r7, 245
LDI r8, 186
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
