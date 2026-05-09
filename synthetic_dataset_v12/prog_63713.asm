; DESCRIPTION: Composite: Places a orange line segment connecting (415, 96) to (273, 35) then Renders a red disk with center (394, 90) and radius 79 then Places a green 107x65 rectangle at position (106, 64).
; PLAN: r0=415(x1), r1=96(y1), r2=273(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=90(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x), r11=64(y), r12=107(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 96
LDI r2, 273
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 90
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 64
LDI r12, 107
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
