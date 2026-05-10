; DESCRIPTION: Composite: Renders a green line between points (249, 214) and (247, 74) then Creates a red circular shape at (29, 169) with radius 28 then Renders a white box of size 108x107 starting at (107, 138).
; PLAN: r0=249(x1), r1=214(y1), r2=247(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=169(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=138(y), r12=108(width), r13=107(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 214
LDI r2, 247
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 169
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 138
LDI r12, 108
LDI r13, 107
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
