; DESCRIPTION: Composite: Renders a orange line between points (383, 112) and (228, 215) then Places a yellow dot at position (395, 195).
; PLAN: r0=383(x1), r1=112(y1), r2=228(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=195(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 112
LDI r2, 228
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 195
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
