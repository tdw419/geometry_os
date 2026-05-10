; DESCRIPTION: Composite: Places a cyan dot at position (369, 229) then Places a orange circle of radius 38 at center (413, 128).
; PLAN: r0=369(x), r1=229(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=128(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 229
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 128
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
