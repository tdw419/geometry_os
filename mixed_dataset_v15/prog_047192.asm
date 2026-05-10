; DESCRIPTION: Composite: Creates a blue rectangular region at (64, 173) spanning 70 by 27 pixels then Sets a single yellow pixel at (482, 56) then Renders a blue line between points (58, 204) and (145, 132).
; PLAN: r0=64(x), r1=173(y), r2=70(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=56(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=58(x1), r11=204(y1), r12=145(x2), r13=132(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 173
LDI r2, 70
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 56
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 58
LDI r11, 204
LDI r12, 145
LDI r13, 132
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
