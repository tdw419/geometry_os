; DESCRIPTION: Composite: Places a purple line segment connecting (383, 195) to (133, 228) then Places a magenta dot at position (170, 51).
; PLAN: r0=383(x1), r1=195(y1), r2=133(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=51(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 195
LDI r2, 133
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 51
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
