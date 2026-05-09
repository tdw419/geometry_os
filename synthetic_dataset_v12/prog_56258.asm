; DESCRIPTION: Composite: Draws a cyan line from (344, 11) to (73, 111) then Renders a cyan disk with center (286, 149) and radius 37 then Renders a yellow box of size 74x20 starting at (430, 79).
; PLAN: r0=344(x1), r1=11(y1), r2=73(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=149(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=79(y), r12=74(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 11
LDI r2, 73
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 149
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 79
LDI r12, 74
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
