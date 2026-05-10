; DESCRIPTION: Composite: Places a purple line segment connecting (413, 136) to (453, 81) then Places a white dot at position (89, 12) then Renders a green box of size 11x38 starting at (215, 187).
; PLAN: r0=413(x1), r1=136(y1), r2=453(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=12(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=187(y), r12=11(width), r13=38(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 136
LDI r2, 453
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 12
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 187
LDI r12, 11
LDI r13, 38
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
