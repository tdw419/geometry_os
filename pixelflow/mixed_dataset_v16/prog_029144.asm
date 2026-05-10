; DESCRIPTION: Composite: Renders a purple line between points (326, 213) and (301, 33) then Creates a red circular shape at (152, 70) with radius 60 then Sets a single black pixel at (134, 61).
; PLAN: r0=326(x1), r1=213(y1), r2=301(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=70(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x), r11=61(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 213
LDI r2, 301
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 70
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 61
LDI r12, 0x000000
PSET r10, r11, r12
HALT
