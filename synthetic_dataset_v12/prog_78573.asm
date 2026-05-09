; DESCRIPTION: Composite: Places a yellow 112x48 rectangle at position (307, 184) then Creates a green circular shape at (459, 164) with radius 35 then Renders a green line between points (12, 242) and (385, 61).
; PLAN: r0=307(x), r1=184(y), r2=112(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=164(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x1), r11=242(y1), r12=385(x2), r13=61(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 184
LDI r2, 112
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 164
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 242
LDI r12, 385
LDI r13, 61
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
