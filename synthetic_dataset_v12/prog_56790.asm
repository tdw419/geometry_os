; DESCRIPTION: Composite: Places a green 98x14 rectangle at position (301, 38) then Renders a black line between points (135, 14) and (359, 55) then Places a white dot at position (103, 90).
; PLAN: r0=301(x), r1=38(y), r2=98(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x1), r6=14(y1), r7=359(x2), r8=55(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=90(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 38
LDI r2, 98
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 14
LDI r7, 359
LDI r8, 55
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 90
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
