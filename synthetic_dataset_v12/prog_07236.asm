; DESCRIPTION: Composite: Places a yellow dot at position (21, 109) then Creates a red circular shape at (330, 91) with radius 54.
; PLAN: r0=21(x), r1=109(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=91(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 109
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 330
LDI r6, 91
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
