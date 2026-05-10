; DESCRIPTION: Composite: Renders a yellow line between points (200, 158) and (193, 135) then Places a blue 70x102 rectangle at position (36, 97).
; PLAN: r0=200(x1), r1=158(y1), r2=193(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=97(y), r7=70(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 158
LDI r2, 193
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 97
LDI r7, 70
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
