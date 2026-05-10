; DESCRIPTION: Composite: Places a yellow dot at position (454, 30) then Renders a blue line between points (461, 72) and (288, 65) then Draws a white rectangle at (388, 6) with width 108 and height 46.
; PLAN: r0=454(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=72(y1), r7=288(x2), r8=65(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=388(x), r11=6(y), r12=108(width), r13=46(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 72
LDI r7, 288
LDI r8, 65
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 6
LDI r12, 108
LDI r13, 46
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
