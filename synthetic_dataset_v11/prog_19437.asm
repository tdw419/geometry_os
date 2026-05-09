; DESCRIPTION: Composite: . Then Places a purple line segment connecting (108, 220) to (234, 96). Then Renders a yellow box of size 13x47 starting at (109, 128).
; PLAN: r0=108(x1), r1=220(y1), r2=234(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=109(x), r1=128(y), r2=13(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (108, 220) to (234, 96).
; PLAN: r0=108(x1), r1=220(y1), r2=234(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 220
LDI r2, 234
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 13x47 starting at (109, 128).
; PLAN: r0=109(x), r1=128(y), r2=13(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 128
LDI r2, 13
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
