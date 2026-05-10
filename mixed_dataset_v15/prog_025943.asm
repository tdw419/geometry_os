; DESCRIPTION: Composite: Sets a single blue pixel at (239, 248) then Renders a black disk with center (326, 226) and radius 16 then Draws a black line from (72, 145) to (337, 80).
; PLAN: r0=239(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=226(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x1), r11=145(y1), r12=337(x2), r13=80(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 226
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 145
LDI r12, 337
LDI r13, 80
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
