; DESCRIPTION: Composite: Draws a yellow line from (52, 190) to (213, 82) then Draws a orange circle centered at (53, 183) with radius 27.
; PLAN: r0=52(x1), r1=190(y1), r2=213(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=183(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 190
LDI r2, 213
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 183
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
