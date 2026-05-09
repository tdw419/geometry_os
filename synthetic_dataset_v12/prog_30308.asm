; DESCRIPTION: Composite: Renders a red line between points (182, 145) and (71, 7) then Draws a cyan circle centered at (165, 144) with radius 32.
; PLAN: r0=182(x1), r1=145(y1), r2=71(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=144(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 145
LDI r2, 71
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 144
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
