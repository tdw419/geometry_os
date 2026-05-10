; DESCRIPTION: Composite: Renders a black line between points (416, 46) and (493, 34) then Draws a cyan circle centered at (452, 161) with radius 48 then Places a purple dot at position (387, 14).
; PLAN: r0=416(x1), r1=46(y1), r2=493(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=161(y), r7=48(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x), r11=14(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 46
LDI r2, 493
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 161
LDI r7, 48
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 14
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
