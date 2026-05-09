; DESCRIPTION: Composite: Renders a magenta line between points (46, 130) and (128, 165) then Places a magenta dot at position (363, 133).
; PLAN: r0=46(x1), r1=130(y1), r2=128(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=133(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 130
LDI r2, 128
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 133
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
