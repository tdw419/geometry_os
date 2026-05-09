; DESCRIPTION: Composite: Renders a cyan box of size 66x19 starting at (434, 144) then Renders a yellow disk with center (45, 59) and radius 27 then Renders a blue line between points (356, 251) and (133, 198).
; PLAN: r0=434(x), r1=144(y), r2=66(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=59(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x1), r11=251(y1), r12=133(x2), r13=198(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 144
LDI r2, 66
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 59
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 251
LDI r12, 133
LDI r13, 198
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
