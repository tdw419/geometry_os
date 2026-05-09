; DESCRIPTION: Composite: Renders a red line between points (396, 225) and (108, 200) then Places a yellow 23x81 rectangle at position (60, 23).
; PLAN: r0=396(x1), r1=225(y1), r2=108(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=23(y), r7=23(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 225
LDI r2, 108
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 23
LDI r7, 23
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
