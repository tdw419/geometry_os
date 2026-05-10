; DESCRIPTION: Composite: Renders a white line between points (420, 133) and (186, 194) then Renders a white box of size 86x10 starting at (260, 94) then Places a black dot at position (209, 80).
; PLAN: r0=420(x1), r1=133(y1), r2=186(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=94(y), r7=86(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=80(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 133
LDI r2, 186
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 94
LDI r7, 86
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 80
LDI r12, 0x000000
PSET r10, r11, r12
HALT
