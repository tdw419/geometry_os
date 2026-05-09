; DESCRIPTION: Composite: Places a cyan dot at position (193, 181) then Draws a black line from (385, 59) to (2, 224) then Creates a blue rectangular region at (325, 1) spanning 99 by 51 pixels.
; PLAN: r0=193(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=59(y1), r7=2(x2), r8=224(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=1(y), r12=99(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 59
LDI r7, 2
LDI r8, 224
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 1
LDI r12, 99
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
