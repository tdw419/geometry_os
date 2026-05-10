; DESCRIPTION: Composite: Draws a yellow circle centered at (434, 131) with radius 72 then Places a red dot at position (41, 202).
; PLAN: r0=434(x), r1=131(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=202(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 131
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 202
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
