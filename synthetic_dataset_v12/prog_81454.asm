; DESCRIPTION: Composite: Places a purple circle of radius 72 at center (337, 160) then Places a cyan dot at position (125, 222).
; PLAN: r0=337(x), r1=160(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=222(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 160
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 222
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
