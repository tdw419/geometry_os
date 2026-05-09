; DESCRIPTION: Composite: Places a cyan 117x71 rectangle at position (57, 169) then Renders a green line between points (317, 143) and (141, 171) then Places a purple circle of radius 22 at center (286, 46).
; PLAN: r0=57(x), r1=169(y), r2=117(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=143(y1), r7=141(x2), r8=171(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=46(y), r12=22(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 169
LDI r2, 117
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 143
LDI r7, 141
LDI r8, 171
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 46
LDI r12, 22
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
