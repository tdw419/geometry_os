; DESCRIPTION: Composite: Renders a magenta line between points (33, 157) and (121, 34) then Places a magenta circle of radius 44 at center (182, 198).
; PLAN: r0=33(x1), r1=157(y1), r2=121(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=198(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 157
LDI r2, 121
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 198
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
