; DESCRIPTION: Composite: Places a black line segment connecting (76, 112) to (405, 219) then Sets a single cyan pixel at (237, 24) then Places a purple 105x68 rectangle at position (177, 178).
; PLAN: r0=76(x1), r1=112(y1), r2=405(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=24(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=178(y), r12=105(width), r13=68(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 112
LDI r2, 405
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 24
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 177
LDI r11, 178
LDI r12, 105
LDI r13, 68
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
