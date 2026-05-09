; DESCRIPTION: Composite: Renders a red line between points (385, 241) and (233, 111) then Creates a white circular shape at (363, 177) with radius 71 then Renders a red box of size 106x48 starting at (337, 26).
; PLAN: r0=385(x1), r1=241(y1), r2=233(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=177(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x), r11=26(y), r12=106(width), r13=48(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 241
LDI r2, 233
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 177
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 26
LDI r12, 106
LDI r13, 48
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
