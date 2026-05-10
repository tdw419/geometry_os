; DESCRIPTION: Composite: Creates a yellow rectangular region at (1, 108) spanning 49 by 70 pixels then Renders a black line between points (396, 135) and (208, 27) then Sets a single cyan pixel at (277, 233).
; PLAN: r0=1(x), r1=108(y), r2=49(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=135(y1), r7=208(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=233(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 108
LDI r2, 49
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 135
LDI r7, 208
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 233
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
