; DESCRIPTION: Composite: Draws a cyan line from (165, 45) to (242, 105) then Places a yellow dot at position (18, 90).
; PLAN: r0=165(x1), r1=45(y1), r2=242(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=90(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 45
LDI r2, 242
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 90
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
