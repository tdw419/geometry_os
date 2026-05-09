; DESCRIPTION: Composite: Renders a black disk with center (245, 77) and radius 53 then Draws a white line from (429, 62) to (210, 90) then Sets a single magenta pixel at (196, 22).
; PLAN: r0=245(x), r1=77(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x1), r6=62(y1), r7=210(x2), r8=90(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=22(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 77
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 62
LDI r7, 210
LDI r8, 90
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 22
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
