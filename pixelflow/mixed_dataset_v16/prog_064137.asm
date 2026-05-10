; DESCRIPTION: Composite: Renders a white line between points (216, 153) and (82, 173) then Places a red dot at position (87, 25).
; PLAN: r0=216(x1), r1=153(y1), r2=82(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=25(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 153
LDI r2, 82
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 25
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
