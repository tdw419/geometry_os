; DESCRIPTION: Composite: Sets a single cyan pixel at (279, 177) then Draws a magenta circle centered at (90, 62) with radius 58 then Renders a yellow line between points (421, 77) and (80, 96).
; PLAN: r0=279(x), r1=177(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=62(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=421(x1), r11=77(y1), r12=80(x2), r13=96(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 177
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 62
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 421
LDI r11, 77
LDI r12, 80
LDI r13, 96
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
