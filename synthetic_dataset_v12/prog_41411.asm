; DESCRIPTION: Composite: Sets a single green pixel at (154, 88) then Draws a cyan line from (29, 173) to (402, 156).
; PLAN: r0=154(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=29(x1), r6=173(y1), r7=402(x2), r8=156(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 29
LDI r6, 173
LDI r7, 402
LDI r8, 156
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
