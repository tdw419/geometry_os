; DESCRIPTION: Composite: Places a purple dot at position (275, 221) then Places a black line segment connecting (429, 71) to (466, 8).
; PLAN: r0=275(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=71(y1), r7=466(x2), r8=8(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 221
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 71
LDI r7, 466
LDI r8, 8
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
