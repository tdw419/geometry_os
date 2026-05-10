; DESCRIPTION: Composite: Sets a single green pixel at (500, 57) then Renders a magenta line between points (457, 165) and (128, 8).
; PLAN: r0=500(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=165(y1), r7=128(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 57
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 457
LDI r6, 165
LDI r7, 128
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
