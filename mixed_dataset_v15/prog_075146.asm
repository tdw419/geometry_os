; DESCRIPTION: Composite: Creates a blue circular shape at (445, 91) with radius 34 then Places a cyan dot at position (409, 57).
; PLAN: r0=445(x), r1=91(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=57(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 445
LDI r1, 91
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 57
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
