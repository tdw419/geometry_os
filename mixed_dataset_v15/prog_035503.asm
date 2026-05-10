; DESCRIPTION: Composite: Renders a red line between points (458, 226) and (162, 173) then Places a blue dot at position (106, 115).
; PLAN: r0=458(x1), r1=226(y1), r2=162(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=115(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 226
LDI r2, 162
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 115
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
