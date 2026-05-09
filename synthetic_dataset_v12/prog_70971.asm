; DESCRIPTION: Composite: Renders a yellow line between points (12, 116) and (483, 160) then Places a magenta circle of radius 68 at center (394, 121).
; PLAN: r0=12(x1), r1=116(y1), r2=483(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=121(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 116
LDI r2, 483
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 121
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
