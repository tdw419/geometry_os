; DESCRIPTION: Composite: Places a yellow dot at position (120, 5) then Places a cyan circle of radius 60 at center (350, 74).
; PLAN: r0=120(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=74(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 350
LDI r6, 74
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
