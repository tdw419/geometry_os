; DESCRIPTION: Composite: Places a cyan line segment connecting (226, 254) to (395, 128) then Places a black dot at position (270, 48).
; PLAN: r0=226(x1), r1=254(y1), r2=395(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=48(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 254
LDI r2, 395
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 48
LDI r7, 0x000000
PSET r5, r6, r7
HALT
