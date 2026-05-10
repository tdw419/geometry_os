; DESCRIPTION: Composite: Renders a white line between points (131, 22) and (29, 222) then Places a red dot at position (444, 171).
; PLAN: r0=131(x1), r1=22(y1), r2=29(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=171(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 22
LDI r2, 29
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 171
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
