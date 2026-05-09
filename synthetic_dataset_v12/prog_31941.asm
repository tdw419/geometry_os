; DESCRIPTION: Composite: Places a yellow dot at position (384, 208) then Renders a green line between points (447, 156) and (85, 108).
; PLAN: r0=384(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=156(y1), r7=85(x2), r8=108(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 447
LDI r6, 156
LDI r7, 85
LDI r8, 108
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
