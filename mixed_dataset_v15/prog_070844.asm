; DESCRIPTION: Composite: Places a blue line segment connecting (240, 78) to (347, 217) then Renders a magenta box of size 120x14 starting at (285, 79) then Places a purple dot at position (410, 14).
; PLAN: r0=240(x1), r1=78(y1), r2=347(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=79(y), r7=120(width), r8=14(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=14(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 78
LDI r2, 347
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 79
LDI r7, 120
LDI r8, 14
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 14
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
