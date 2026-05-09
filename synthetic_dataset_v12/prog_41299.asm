; DESCRIPTION: Composite: Places a purple 96x56 rectangle at position (169, 130) then Places a yellow line segment connecting (75, 141) to (90, 193) then Places a cyan dot at position (420, 244).
; PLAN: r0=169(x), r1=130(y), r2=96(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=141(y1), r7=90(x2), r8=193(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=244(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 130
LDI r2, 96
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 141
LDI r7, 90
LDI r8, 193
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 244
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
