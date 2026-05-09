; DESCRIPTION: Composite: Places a blue line segment connecting (453, 214) to (187, 136) then Sets a single purple pixel at (433, 96) then Renders a green box of size 66x33 starting at (24, 191).
; PLAN: r0=453(x1), r1=214(y1), r2=187(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=96(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=191(y), r12=66(width), r13=33(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 214
LDI r2, 187
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 96
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 191
LDI r12, 66
LDI r13, 33
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
