; DESCRIPTION: Composite: Places a cyan 44x98 rectangle at position (342, 1) then Renders a magenta disk with center (92, 213) and radius 25 then Draws a black line from (284, 148) to (325, 136).
; PLAN: r0=342(x), r1=1(y), r2=44(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=213(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=148(y1), r12=325(x2), r13=136(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 1
LDI r2, 44
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 213
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 148
LDI r12, 325
LDI r13, 136
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
