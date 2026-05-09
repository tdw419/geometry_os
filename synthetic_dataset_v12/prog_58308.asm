; DESCRIPTION: Composite: Renders a blue line between points (160, 172) and (445, 97) then Renders a yellow box of size 66x61 starting at (329, 79) then Places a black circle of radius 16 at center (434, 37).
; PLAN: r0=160(x1), r1=172(y1), r2=445(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=79(y), r7=66(width), r8=61(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x), r11=37(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 172
LDI r2, 445
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 79
LDI r7, 66
LDI r8, 61
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 37
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
