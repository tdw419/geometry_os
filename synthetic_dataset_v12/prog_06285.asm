; DESCRIPTION: Composite: Renders a yellow line between points (301, 64) and (92, 2) then Draws a red circle centered at (247, 97) with radius 71.
; PLAN: r0=301(x1), r1=64(y1), r2=92(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=97(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 64
LDI r2, 92
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 97
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
