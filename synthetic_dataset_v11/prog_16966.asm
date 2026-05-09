; DESCRIPTION: Composite: . Then Renders a red line between points (132, 123) and (87, 7). Then Places a black 104x52 rectangle at position (20, 1).
; PLAN: r0=132(x1), r1=123(y1), r2=87(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=1(y), r2=104(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (132, 123) and (87, 7).
; PLAN: r0=132(x1), r1=123(y1), r2=87(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 123
LDI r2, 87
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 104x52 rectangle at position (20, 1).
; PLAN: r0=20(x), r1=1(y), r2=104(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 1
LDI r2, 104
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
