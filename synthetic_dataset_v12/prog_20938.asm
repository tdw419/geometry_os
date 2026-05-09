; DESCRIPTION: Composite: Sets a single cyan pixel at (305, 102) then Creates a red circular shape at (105, 108) with radius 59 then Draws a black line from (318, 0) to (480, 107).
; PLAN: r0=305(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=108(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x1), r11=0(y1), r12=480(x2), r13=107(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 108
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 0
LDI r12, 480
LDI r13, 107
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
