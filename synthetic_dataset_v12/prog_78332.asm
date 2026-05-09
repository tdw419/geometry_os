; DESCRIPTION: Composite: Places a orange 31x111 rectangle at position (404, 115) then Sets a single blue pixel at (233, 87).
; PLAN: r0=404(x), r1=115(y), r2=31(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=87(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 115
LDI r2, 31
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 87
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
