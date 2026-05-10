; DESCRIPTION: Composite: Renders a cyan line between points (240, 55) and (214, 112) then Places a magenta circle of radius 55 at center (300, 115) then Places a red dot at position (122, 139).
; PLAN: r0=240(x1), r1=55(y1), r2=214(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=115(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=139(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 55
LDI r2, 214
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 115
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 139
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
