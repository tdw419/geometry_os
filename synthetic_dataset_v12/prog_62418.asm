; DESCRIPTION: Composite: Draws a cyan line from (380, 4) to (506, 42) then Places a magenta circle of radius 45 at center (115, 114) then Places a black dot at position (72, 250).
; PLAN: r0=380(x1), r1=4(y1), r2=506(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=114(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=250(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 4
LDI r2, 506
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 114
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 250
LDI r12, 0x000000
PSET r10, r11, r12
HALT
