; DESCRIPTION: Composite: Places a white circle of radius 42 at center (305, 144) then Places a blue dot at position (247, 114).
; PLAN: r0=305(x), r1=144(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=114(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 144
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 114
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
