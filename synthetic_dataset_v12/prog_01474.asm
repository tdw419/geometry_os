; DESCRIPTION: Composite: Renders a green line between points (49, 208) and (175, 248) then Places a magenta circle of radius 71 at center (424, 161).
; PLAN: r0=49(x1), r1=208(y1), r2=175(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=161(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 208
LDI r2, 175
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 161
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
