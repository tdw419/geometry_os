; DESCRIPTION: Composite: Renders a purple box of size 27x13 starting at (217, 10) then Places a green dot at position (294, 156) then Renders a blue line between points (171, 135) and (419, 88).
; PLAN: r0=217(x), r1=10(y), r2=27(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=156(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=171(x1), r11=135(y1), r12=419(x2), r13=88(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 10
LDI r2, 27
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 156
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 171
LDI r11, 135
LDI r12, 419
LDI r13, 88
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
