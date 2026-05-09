; DESCRIPTION: Composite: Renders a white box of size 112x13 starting at (399, 88) then Sets a single cyan pixel at (133, 255) then Draws a magenta line from (446, 70) to (256, 200).
; PLAN: r0=399(x), r1=88(y), r2=112(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=255(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=446(x1), r11=70(y1), r12=256(x2), r13=200(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 88
LDI r2, 112
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 255
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 446
LDI r11, 70
LDI r12, 256
LDI r13, 200
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
