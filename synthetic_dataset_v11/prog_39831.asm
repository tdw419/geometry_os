; DESCRIPTION: Composite: . Then Places a purple 60x104 rectangle at position (110, 62). Then Renders a yellow line between points (36, 241) and (106, 24).
; PLAN: r0=110(x), r1=62(y), r2=60(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=36(x1), r1=241(y1), r2=106(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 60x104 rectangle at position (110, 62).
; PLAN: r0=110(x), r1=62(y), r2=60(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 62
LDI r2, 60
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (36, 241) and (106, 24).
; PLAN: r0=36(x1), r1=241(y1), r2=106(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 241
LDI r2, 106
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
