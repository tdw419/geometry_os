; DESCRIPTION: Composite: Places a yellow dot at position (280, 63) then Places a cyan line segment connecting (262, 147) to (299, 140).
; PLAN: r0=280(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=147(y1), r7=299(x2), r8=140(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 262
LDI r6, 147
LDI r7, 299
LDI r8, 140
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
