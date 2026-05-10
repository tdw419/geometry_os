; DESCRIPTION: Composite: Renders a magenta line between points (90, 144) and (363, 113) then Places a red dot at position (50, 187).
; PLAN: r0=90(x1), r1=144(y1), r2=363(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=187(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 144
LDI r2, 363
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 187
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
