; DESCRIPTION: Composite: Renders a black line between points (121, 190) and (238, 181) then Places a cyan circle of radius 23 at center (305, 182) then Places a purple dot at position (28, 111).
; PLAN: r0=121(x1), r1=190(y1), r2=238(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=182(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=111(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 190
LDI r2, 238
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 182
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 111
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
