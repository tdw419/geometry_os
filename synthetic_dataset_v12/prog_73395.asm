; DESCRIPTION: Composite: Draws a purple line from (124, 90) to (8, 164) then Renders a white disk with center (99, 196) and radius 56 then Creates a cyan rectangular region at (239, 135) spanning 98 by 117 pixels.
; PLAN: r0=124(x1), r1=90(y1), r2=8(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=196(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=135(y), r12=98(width), r13=117(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 90
LDI r2, 8
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 196
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 135
LDI r12, 98
LDI r13, 117
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
