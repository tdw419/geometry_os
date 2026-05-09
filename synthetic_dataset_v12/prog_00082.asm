; DESCRIPTION: Composite: Places a yellow line segment connecting (408, 70) to (485, 22) then Renders a red disk with center (446, 135) and radius 19 then Sets a single white pixel at (474, 38).
; PLAN: r0=408(x1), r1=70(y1), r2=485(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=135(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x), r11=38(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 70
LDI r2, 485
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 135
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 38
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
