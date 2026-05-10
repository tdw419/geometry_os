; DESCRIPTION: Composite: Renders a yellow disk with center (327, 149) and radius 51 then Draws a yellow line from (212, 101) to (183, 138).
; PLAN: r0=327(x), r1=149(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x1), r6=101(y1), r7=183(x2), r8=138(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 149
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 101
LDI r7, 183
LDI r8, 138
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
