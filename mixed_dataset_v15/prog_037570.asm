; DESCRIPTION: Composite: Draws a yellow line from (181, 50) to (240, 11) then Places a purple dot at position (443, 173).
; PLAN: r0=181(x1), r1=50(y1), r2=240(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=173(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 50
LDI r2, 240
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 173
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
