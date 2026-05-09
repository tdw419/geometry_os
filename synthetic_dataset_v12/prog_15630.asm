; DESCRIPTION: Composite: Sets a single cyan pixel at (425, 132) then Places a yellow circle of radius 36 at center (340, 196).
; PLAN: r0=425(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=196(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 196
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
