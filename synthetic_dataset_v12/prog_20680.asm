; DESCRIPTION: Composite: Places a green dot at position (327, 181) then Creates a cyan circular shape at (308, 178) with radius 34.
; PLAN: r0=327(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=178(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 308
LDI r6, 178
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
