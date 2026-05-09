; DESCRIPTION: Composite: Places a yellow circle of radius 36 at center (308, 93) then Places a cyan dot at position (416, 88).
; PLAN: r0=308(x), r1=93(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 93
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
