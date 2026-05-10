; DESCRIPTION: Composite: Sets a single cyan pixel at (2, 37) then Renders a red disk with center (346, 176) and radius 10.
; PLAN: r0=2(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=176(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 176
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
