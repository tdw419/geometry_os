; DESCRIPTION: Composite: Renders a red disk with center (281, 82) and radius 79 then Renders a orange line between points (240, 136) and (265, 74) then Renders a yellow box of size 46x103 starting at (39, 100).
; PLAN: r0=281(x), r1=82(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x1), r6=136(y1), r7=265(x2), r8=74(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=100(y), r12=46(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 82
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 136
LDI r7, 265
LDI r8, 74
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 100
LDI r12, 46
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
