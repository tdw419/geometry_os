; DESCRIPTION: Composite: Places a yellow dot at position (272, 163) then Renders a magenta line between points (273, 64) and (281, 135).
; PLAN: r0=272(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=273(x1), r6=64(y1), r7=281(x2), r8=135(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 273
LDI r6, 64
LDI r7, 281
LDI r8, 135
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
