; DESCRIPTION: Composite: Draws a orange rectangle at (394, 23) with width 56 and height 11 then Renders a green disk with center (198, 220) and radius 33 then Draws a cyan line from (433, 1) to (65, 105).
; PLAN: r0=394(x), r1=23(y), r2=56(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=220(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x1), r11=1(y1), r12=65(x2), r13=105(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 23
LDI r2, 56
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 220
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 1
LDI r12, 65
LDI r13, 105
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
