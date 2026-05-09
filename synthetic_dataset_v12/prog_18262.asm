; DESCRIPTION: Composite: Creates a red circular shape at (113, 160) with radius 25 then Places a blue dot at position (299, 208).
; PLAN: r0=113(x), r1=160(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=208(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 113
LDI r1, 160
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 208
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
