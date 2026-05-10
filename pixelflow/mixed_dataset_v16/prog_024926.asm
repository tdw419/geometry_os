; DESCRIPTION: Composite: Renders a yellow line between points (356, 155) and (237, 173) then Places a white circle of radius 39 at center (450, 169).
; PLAN: r0=356(x1), r1=155(y1), r2=237(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=169(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 155
LDI r2, 237
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 169
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
