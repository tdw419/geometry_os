; DESCRIPTION: Composite: Renders a cyan line between points (182, 158) and (26, 111) then Places a purple dot at position (380, 153).
; PLAN: r0=182(x1), r1=158(y1), r2=26(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 182
LDI r1, 158
LDI r2, 26
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
