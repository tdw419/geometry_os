; DESCRIPTION: Composite: Places a red line segment connecting (403, 46) to (301, 17) then Draws a blue rectangle at (286, 135) with width 20 and height 62 then Sets a single green pixel at (478, 52).
; PLAN: r0=403(x1), r1=46(y1), r2=301(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=135(y), r7=20(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x), r11=52(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 46
LDI r2, 301
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 135
LDI r7, 20
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 52
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
