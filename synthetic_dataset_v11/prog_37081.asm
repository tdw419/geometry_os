; DESCRIPTION: Composite: . Then Renders a orange line between points (29, 248) and (237, 119). Then Renders a purple box of size 21x94 starting at (117, 58).
; PLAN: r0=29(x1), r1=248(y1), r2=237(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=58(y), r2=21(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (29, 248) and (237, 119).
; PLAN: r0=29(x1), r1=248(y1), r2=237(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 248
LDI r2, 237
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 21x94 starting at (117, 58).
; PLAN: r0=117(x), r1=58(y), r2=21(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 58
LDI r2, 21
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
