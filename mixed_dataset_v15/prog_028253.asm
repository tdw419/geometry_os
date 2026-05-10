; DESCRIPTION: Composite: Renders a white line between points (245, 243) and (66, 80) then Renders a white box of size 104x16 starting at (19, 61) then Draws a yellow circle centered at (210, 92) with radius 71.
; PLAN: r0=245(x1), r1=243(y1), r2=66(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=61(y), r7=104(width), r8=16(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=92(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 243
LDI r2, 66
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 61
LDI r7, 104
LDI r8, 16
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 92
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
