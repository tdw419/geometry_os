; DESCRIPTION: Composite: . Then Renders a black line between points (195, 65) and (14, 222). Then Places a purple 117x36 rectangle at position (30, 4).
; PLAN: r0=195(x1), r1=65(y1), r2=14(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=4(y), r2=117(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (195, 65) and (14, 222).
; PLAN: r0=195(x1), r1=65(y1), r2=14(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 65
LDI r2, 14
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 117x36 rectangle at position (30, 4).
; PLAN: r0=30(x), r1=4(y), r2=117(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 4
LDI r2, 117
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
