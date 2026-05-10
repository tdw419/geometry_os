; DESCRIPTION: Composite: Places a red 48x52 rectangle at position (285, 119) then Sets a single orange pixel at (221, 53).
; PLAN: r0=285(x), r1=119(y), r2=48(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=53(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 119
LDI r2, 48
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 53
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
