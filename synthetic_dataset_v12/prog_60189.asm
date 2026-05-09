; DESCRIPTION: Composite: Renders a red line between points (137, 152) and (99, 173) then Renders a purple disk with center (74, 153) and radius 74.
; PLAN: r0=137(x1), r1=152(y1), r2=99(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=153(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 152
LDI r2, 99
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 153
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
