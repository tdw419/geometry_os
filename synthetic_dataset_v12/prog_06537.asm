; DESCRIPTION: Composite: Places a yellow line segment connecting (26, 58) to (75, 130) then Renders a green disk with center (221, 68) and radius 30 then Renders a black box of size 56x50 starting at (92, 132).
; PLAN: r0=26(x1), r1=58(y1), r2=75(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=68(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=132(y), r12=56(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 58
LDI r2, 75
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 68
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 132
LDI r12, 56
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
