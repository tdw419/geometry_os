; DESCRIPTION: Composite: Renders a black line between points (80, 34) and (93, 209) then Places a yellow 43x14 rectangle at position (376, 89).
; PLAN: r0=80(x1), r1=34(y1), r2=93(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=89(y), r7=43(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 34
LDI r2, 93
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 89
LDI r7, 43
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
