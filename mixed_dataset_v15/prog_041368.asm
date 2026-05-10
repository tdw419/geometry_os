; DESCRIPTION: Composite: Places a blue circle of radius 39 at center (212, 212) then Places a blue dot at position (344, 29).
; PLAN: r0=212(x), r1=212(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=29(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 212
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 29
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
