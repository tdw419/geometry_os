; DESCRIPTION: Composite: Sets a single orange pixel at (436, 148) then Places a cyan line segment connecting (387, 138) to (67, 191).
; PLAN: r0=436(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=387(x1), r6=138(y1), r7=67(x2), r8=191(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 387
LDI r6, 138
LDI r7, 67
LDI r8, 191
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
