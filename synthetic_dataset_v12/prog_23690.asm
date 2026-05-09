; DESCRIPTION: Composite: Renders a cyan line between points (80, 204) and (6, 190) then Sets a single magenta pixel at (113, 172) then Places a black 106x17 rectangle at position (158, 233).
; PLAN: r0=80(x1), r1=204(y1), r2=6(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=172(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=233(y), r12=106(width), r13=17(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 204
LDI r2, 6
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 172
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 233
LDI r12, 106
LDI r13, 17
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
