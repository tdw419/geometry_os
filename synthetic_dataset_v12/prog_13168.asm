; DESCRIPTION: Composite: Places a purple 81x117 rectangle at position (120, 98) then Renders a orange line between points (80, 166) and (483, 163).
; PLAN: r0=120(x), r1=98(y), r2=81(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=166(y1), r7=483(x2), r8=163(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 98
LDI r2, 81
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 166
LDI r7, 483
LDI r8, 163
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
