; DESCRIPTION: Composite: Renders a blue disk with center (281, 96) and radius 56 then Renders a white line between points (204, 11) and (190, 93) then Renders a cyan box of size 84x93 starting at (323, 92).
; PLAN: r0=281(x), r1=96(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x1), r6=11(y1), r7=190(x2), r8=93(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=92(y), r12=84(width), r13=93(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 96
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 11
LDI r7, 190
LDI r8, 93
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 92
LDI r12, 84
LDI r13, 93
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
