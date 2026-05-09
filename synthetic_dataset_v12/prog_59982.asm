; DESCRIPTION: Composite: Places a orange 57x38 rectangle at position (221, 81) then Renders a red line between points (302, 134) and (487, 211) then Draws a cyan circle centered at (278, 60) with radius 44.
; PLAN: r0=221(x), r1=81(y), r2=57(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x1), r6=134(y1), r7=487(x2), r8=211(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=278(x), r11=60(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 81
LDI r2, 57
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 134
LDI r7, 487
LDI r8, 211
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 60
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
