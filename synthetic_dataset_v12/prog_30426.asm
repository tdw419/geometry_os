; DESCRIPTION: Composite: Renders a green line between points (33, 4) and (240, 38) then Creates a green rectangular region at (301, 79) spanning 18 by 24 pixels then Places a yellow dot at position (233, 3).
; PLAN: r0=33(x1), r1=4(y1), r2=240(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=79(y), r7=18(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=3(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 4
LDI r2, 240
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 79
LDI r7, 18
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 3
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
