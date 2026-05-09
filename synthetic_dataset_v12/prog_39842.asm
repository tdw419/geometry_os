; DESCRIPTION: Composite: Renders a magenta line between points (115, 107) and (167, 13) then Renders a purple disk with center (458, 219) and radius 24 then Places a white 72x67 rectangle at position (423, 110).
; PLAN: r0=115(x1), r1=107(y1), r2=167(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=219(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=110(y), r12=72(width), r13=67(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 107
LDI r2, 167
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 219
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 110
LDI r12, 72
LDI r13, 67
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
