; DESCRIPTION: Composite: Renders a yellow line between points (92, 115) and (236, 244) then Places a black circle of radius 27 at center (268, 134) then Places a magenta dot at position (167, 24).
; PLAN: r0=92(x1), r1=115(y1), r2=236(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=134(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=24(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 115
LDI r2, 236
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 134
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 24
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
