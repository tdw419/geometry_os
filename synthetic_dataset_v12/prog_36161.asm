; DESCRIPTION: Composite: Places a cyan 17x20 rectangle at position (216, 89) then Sets a single purple pixel at (95, 107).
; PLAN: r0=216(x), r1=89(y), r2=17(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=107(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 89
LDI r2, 17
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 107
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
