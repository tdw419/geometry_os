; DESCRIPTION: Composite: Places a red dot at position (489, 149) then Creates a green circular shape at (328, 120) with radius 79.
; PLAN: r0=489(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=120(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 328
LDI r6, 120
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
