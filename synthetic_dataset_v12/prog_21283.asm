; DESCRIPTION: Composite: Places a red 93x119 rectangle at position (100, 32) then Renders a purple disk with center (176, 177) and radius 46 then Places a magenta dot at position (7, 233).
; PLAN: r0=100(x), r1=32(y), r2=93(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=177(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 32
LDI r2, 93
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 177
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
