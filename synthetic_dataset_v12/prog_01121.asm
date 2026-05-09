; DESCRIPTION: Composite: Renders a black line between points (387, 93) and (268, 255) then Places a green circle of radius 29 at center (161, 203).
; PLAN: r0=387(x1), r1=93(y1), r2=268(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=203(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 387
LDI r1, 93
LDI r2, 268
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 203
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
