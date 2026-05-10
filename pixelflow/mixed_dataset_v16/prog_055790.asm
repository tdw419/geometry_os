; DESCRIPTION: Composite: Sets a single green pixel at (160, 153) then Draws a green circle centered at (262, 193) with radius 51 then Draws a cyan line from (471, 88) to (108, 15).
; PLAN: r0=160(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=193(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x1), r11=88(y1), r12=108(x2), r13=15(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 262
LDI r6, 193
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 88
LDI r12, 108
LDI r13, 15
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
