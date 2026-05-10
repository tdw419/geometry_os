; DESCRIPTION: Composite: Places a white 39x14 rectangle at position (265, 139) then Renders a cyan line between points (82, 70) and (336, 169) then Renders a black disk with center (79, 89) and radius 76.
; PLAN: r0=265(x), r1=139(y), r2=39(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x1), r6=70(y1), r7=336(x2), r8=169(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=89(y), r12=76(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 139
LDI r2, 39
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 70
LDI r7, 336
LDI r8, 169
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 89
LDI r12, 76
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
