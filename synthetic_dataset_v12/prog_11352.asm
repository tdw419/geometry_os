; DESCRIPTION: Composite: Places a orange dot at position (294, 23) then Renders a green line between points (24, 63) and (371, 144).
; PLAN: r0=294(x), r1=23(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=24(x1), r6=63(y1), r7=371(x2), r8=144(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 23
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 24
LDI r6, 63
LDI r7, 371
LDI r8, 144
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
