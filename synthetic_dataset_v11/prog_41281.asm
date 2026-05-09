; DESCRIPTION: Composite: . Then Places a black line segment connecting (215, 59) to (20, 125). Then Renders a purple box of size 56x87 starting at (96, 123).
; PLAN: r0=215(x1), r1=59(y1), r2=20(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=123(y), r2=56(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (215, 59) to (20, 125).
; PLAN: r0=215(x1), r1=59(y1), r2=20(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 59
LDI r2, 20
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 56x87 starting at (96, 123).
; PLAN: r0=96(x), r1=123(y), r2=56(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 123
LDI r2, 56
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
