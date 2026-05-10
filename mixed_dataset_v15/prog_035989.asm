; DESCRIPTION: Composite: Renders a blue line between points (350, 58) and (327, 71) then Places a magenta circle of radius 62 at center (186, 180).
; PLAN: r0=350(x1), r1=58(y1), r2=327(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=180(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 58
LDI r2, 327
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 180
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
