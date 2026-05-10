; DESCRIPTION: Composite: Renders a white disk with center (74, 70) and radius 10 then Renders a blue box of size 62x18 starting at (75, 28) then Renders a green line between points (39, 64) and (402, 29).
; PLAN: r0=74(x), r1=70(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=28(y), r7=62(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x1), r11=64(y1), r12=402(x2), r13=29(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 70
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 28
LDI r7, 62
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 64
LDI r12, 402
LDI r13, 29
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
