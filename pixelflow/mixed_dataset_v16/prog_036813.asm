; DESCRIPTION: Composite: Renders a yellow box of size 86x35 starting at (115, 147) then Places a blue dot at position (346, 15) then Renders a blue line between points (76, 144) and (356, 120).
; PLAN: r0=115(x), r1=147(y), r2=86(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=15(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=76(x1), r11=144(y1), r12=356(x2), r13=120(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 147
LDI r2, 86
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 15
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 144
LDI r12, 356
LDI r13, 120
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
