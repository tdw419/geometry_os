; DESCRIPTION: Composite: Renders a red line between points (410, 253) and (135, 189) then Creates a red circular shape at (233, 182) with radius 24 then Renders a magenta box of size 85x78 starting at (189, 48).
; PLAN: r0=410(x1), r1=253(y1), r2=135(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=182(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x), r11=48(y), r12=85(width), r13=78(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 253
LDI r2, 135
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 182
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 48
LDI r12, 85
LDI r13, 78
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
