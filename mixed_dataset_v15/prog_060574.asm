; DESCRIPTION: Composite: Places a black dot at position (70, 8) then Renders a yellow disk with center (74, 27) and radius 13.
; PLAN: r0=70(x), r1=8(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=27(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 8
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 74
LDI r6, 27
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
