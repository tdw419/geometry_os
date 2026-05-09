; DESCRIPTION: Composite: Sets a single orange pixel at (106, 206) then Renders a cyan line between points (284, 48) and (306, 21).
; PLAN: r0=106(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=48(y1), r7=306(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 284
LDI r6, 48
LDI r7, 306
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
