; DESCRIPTION: Composite: Renders a red box of size 101x111 starting at (406, 58) then Renders a orange disk with center (439, 135) and radius 48 then Draws a red line from (120, 255) to (251, 37).
; PLAN: r0=406(x), r1=58(y), r2=101(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=135(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x1), r11=255(y1), r12=251(x2), r13=37(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 58
LDI r2, 101
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 135
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 255
LDI r12, 251
LDI r13, 37
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
