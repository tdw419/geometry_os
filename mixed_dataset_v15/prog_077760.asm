; DESCRIPTION: Composite: Places a blue dot at position (0, 42) then Renders a yellow line between points (66, 214) and (47, 130).
; PLAN: r0=0(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=214(y1), r7=47(x2), r8=130(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 214
LDI r7, 47
LDI r8, 130
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
